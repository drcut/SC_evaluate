/*
 * Hetero-mark
 *
 * Copyright (c) 2015 Northeastern University
 * All rights reserved.
 *
 * Developed by:
 *   Northeastern University Computer Architecture Research (NUCAR) Group
 *   Northeastern University
 *   http://www.ece.neu.edu/groups/nucar/
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal with the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 *   Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimers.
 *
 *   Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimers in the
 *   documentation and/or other materials provided with the distribution.
 *
 *   Neither the names of NUCAR, Northeastern University, nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this Software without specific prior written permission.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS WITH THE SOFTWARE.
 */

#include <CL/sycl.hpp>
#include <dpct/dpct.hpp>
#include "src/ga/cuda/ga_cuda_benchmark.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <thread>
#include <vector>

void ga_cuda(char *device_target, char *device_query,
                        char *device_batch_result, uint32_t length,
                        int query_sequence_length, int coarse_match_length,
                        int coarse_match_threshold, int current_position,
                        sycl::nd_item<3> item_ct1) {
  uint tid = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
             item_ct1.get_local_id(2);
  if (tid > length) return;
  bool match = false;
  int max_length = query_sequence_length - coarse_match_length;

  for (uint32_t i = 0; i <= max_length; i++) {
    int distance = 0;
    for (int j = 0; j < coarse_match_length; j++) {
      if (device_target[current_position + tid + j] != device_query[i + j]) {
        distance++;
      }
    }

    if (distance < coarse_match_threshold) {
      match = true;
      break;
    }
  }
  if (match) {
    device_batch_result[tid] = 1;
  }
}

void GaCudaBenchmark::Initialize() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  matches_.clear();
  GaBenchmark::Initialize();
  coarse_match_result_ = new char[target_sequence_.size()]();

  d_target_ = sycl::malloc_device<char>(target_sequence_.size(), q_ct1);
  d_query_ = sycl::malloc_device<char>(query_sequence_.size(), q_ct1);
  d_batch_result_ = sycl::malloc_device<char>(kBatchSize, q_ct1);

  q_ct1
      .memcpy(d_target_, target_sequence_.data(),
              target_sequence_.size() * sizeof(char))
      .wait();
  q_ct1
      .memcpy(d_query_, query_sequence_.data(),
              query_sequence_.size() * sizeof(char))
      .wait();
}

void GaCudaBenchmark::Run() {
  if (collaborative_) {
    CollaborativeRun();
  } else {
    NonCollaborativeRun();
  }
  cpu_gpu_logger_->Summarize();
}

void GaCudaBenchmark::CollaborativeRun() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  matches_.clear();
  uint32_t max_searchable_length =
      target_sequence_.size() - coarse_match_length_;
  std::vector<std::thread> threads;
  uint32_t current_position = 0;

  while (current_position < max_searchable_length) {
    char batch_result[kBatchSize] = {0};
    q_ct1.memset(d_batch_result_, 0, kBatchSize).wait();

    uint32_t end_position = current_position + kBatchSize;
    if (end_position >= max_searchable_length) {
      end_position = max_searchable_length;
    }
    uint32_t length = end_position - current_position;

    sycl::range<3> block_size(1, 1, 64);
    sycl::range<3> grid_size(1, 1,
                             (length + block_size[2] - 1) / block_size[2]);

    cpu_gpu_logger_->GPUOn();
    /*
    DPCT1049:0: The workgroup size passed to the SYCL kernel may exceed the
    limit. To get the device limit, query info::device::max_work_group_size.
    Adjust the workgroup size if needed.
    */
    q_ct1.submit([&](sycl::handler &cgh) {
      auto d_target__ct0 = d_target_;
      auto d_query__ct1 = d_query_;
      auto d_batch_result__ct2 = d_batch_result_;
      auto query_sequence__size_ct4 = query_sequence_.size();
      auto coarse_match_length__ct5 = coarse_match_length_;
      auto coarse_match_threshold__ct6 = coarse_match_threshold_;

      cgh.parallel_for(
          sycl::nd_range<3>(grid_size * block_size, block_size),
          [=](sycl::nd_item<3> item_ct1) {
            ga_cuda(d_target__ct0, d_query__ct1, d_batch_result__ct2, length,
                    query_sequence__size_ct4, coarse_match_length__ct5,
                    coarse_match_threshold__ct6, current_position, item_ct1);
          });
    });
    dev_ct1.queues_wait_and_throw();
    cpu_gpu_logger_->GPUOff();

    q_ct1.memcpy(batch_result, d_batch_result_, kBatchSize * sizeof(char))
        .wait();

    for (uint32_t i = 0; i < length; i++) {
      if (batch_result[i] != 0) {
        uint32_t end = i + current_position + query_sequence_.size();
        if (end > target_sequence_.size()) end = target_sequence_.size();
        threads.push_back(std::thread(&GaCudaBenchmark::FineMatch, this,
                                      i + current_position, end, &matches_));
      }
    }
    current_position = end_position;
  }
  for (auto &thread : threads) {
    thread.join();
  }
}

void GaCudaBenchmark::NonCollaborativeRun() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  uint32_t max_searchable_length =
      target_sequence_.size() - coarse_match_length_;
  std::vector<std::thread> threads;
  uint32_t current_position = 0;

  while (current_position < max_searchable_length) {
    uint32_t end_position = current_position + kBatchSize;
    if (end_position >= max_searchable_length) {
      end_position = max_searchable_length;
    }
    uint32_t length = end_position - current_position;

    sycl::range<3> block_size(1, 1, 64);
    sycl::range<3> grid_size(1, 1,
                             (length + block_size[2] - 1) / block_size[2]);

    q_ct1.memset(d_batch_result_, 0, kBatchSize).wait();

    cpu_gpu_logger_->GPUOn();
    /*
    DPCT1049:1: The workgroup size passed to the SYCL kernel may exceed the
    limit. To get the device limit, query info::device::max_work_group_size.
    Adjust the workgroup size if needed.
    */
    q_ct1.submit([&](sycl::handler &cgh) {
      auto d_target__ct0 = d_target_;
      auto d_query__ct1 = d_query_;
      auto d_batch_result__ct2 = d_batch_result_;
      auto query_sequence__size_ct4 = query_sequence_.size();
      auto coarse_match_length__ct5 = coarse_match_length_;
      auto coarse_match_threshold__ct6 = coarse_match_threshold_;

      cgh.parallel_for(
          sycl::nd_range<3>(grid_size * block_size, block_size),
          [=](sycl::nd_item<3> item_ct1) {
            ga_cuda(d_target__ct0, d_query__ct1, d_batch_result__ct2, length,
                    query_sequence__size_ct4, coarse_match_length__ct5,
                    coarse_match_threshold__ct6, current_position, item_ct1);
          });
    });
    dev_ct1.queues_wait_and_throw();
    cpu_gpu_logger_->GPUOff();

    q_ct1
        .memcpy(coarse_match_result_ + current_position, d_batch_result_,
                kBatchSize * sizeof(char))
        .wait();
    current_position = end_position;
  }

  for (uint32_t i = 0; i < target_sequence_.size(); i++) {
    if (coarse_match_result_[i] != 0) {
      uint32_t end = i + query_sequence_.size();
      if (end > target_sequence_.size()) end = target_sequence_.size();
      threads.push_back(
          std::thread(&GaCudaBenchmark::FineMatch, this, i, end, &matches_));
    }
  }
  for (auto &thread : threads) {
    thread.join();
  }
}

void GaCudaBenchmark::Cleanup() {
  free(coarse_match_result_);
  GaBenchmark::Cleanup();
}
