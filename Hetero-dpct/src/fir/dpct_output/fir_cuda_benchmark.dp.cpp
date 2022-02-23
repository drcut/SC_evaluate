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
 * Author: Yifan Sun (yifansun@coe.neu.edu)
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
 * CONTRIBU TORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS WITH THE SOFTWARE.
 */

#include <CL/sycl.hpp>
#include <dpct/dpct.hpp>
#include "src/fir/cuda/fir_cuda_benchmark.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>

void fir_cuda(float *input, float *output, float *coeff,
                         float *history, uint32_t num_tap, uint32_t num_data,
                         sycl::nd_item<3> item_ct1) {
  uint32_t tid = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
                 item_ct1.get_local_id(2);
  if (tid > num_data) return;

  float sum = 0;
  uint32_t i = 0;
  for (i = 0; i < num_tap; i++) {
    if (tid >= i) {
      sum = sum + coeff[i] * input[tid - i];
    } else {
      sum = sum + coeff[i] * history[num_tap - (i - tid)];
    }
  }
  output[tid] = sum;
}

void FirCudaBenchmark::Initialize() {
  FirBenchmark::Initialize();
  InitializeBuffers();
  InitializeData();
}

void FirCudaBenchmark::InitializeBuffers() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  history_ = reinterpret_cast<float *>(malloc(num_tap_ * sizeof(float)));
  input_buffer_ = sycl::malloc_device<float>(num_data_per_block_, q_ct1);
  output_buffer_ = sycl::malloc_device<float>(num_data_per_block_, q_ct1);
  coeff_buffer_ = sycl::malloc_device<float>(num_tap_, q_ct1);
  history_buffer_ = sycl::malloc_device<float>(num_tap_, q_ct1);
}

void FirCudaBenchmark::InitializeData() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  for (unsigned i = 0; i < num_tap_; i++) {
    history_[i] = 0.0;
  }

  q_ct1.memcpy(history_buffer_, history_, num_tap_ * sizeof(float));
  q_ct1.memcpy(coeff_buffer_, coeff_, num_tap_ * sizeof(float)).wait();
}

void FirCudaBenchmark::Run() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  unsigned int count = 0;

  for (unsigned i = 0; i < num_tap_; i++) {
    history_[i] = 0.0;
  }
  q_ct1.memcpy(history_buffer_, history_, num_tap_ * sizeof(float)).wait();

  sycl::range<3> grid_size(1, 1, num_data_per_block_ / 64);
  sycl::range<3> block_size(1, 1, 64);

  while (count < num_block_) {
    q_ct1.memcpy(input_buffer_, input_ + (count * num_data_per_block_),
                 (num_data_per_block_) * sizeof(float));
    q_ct1.memcpy(history_buffer_, history_, num_tap_ * sizeof(float)).wait();
    cpu_gpu_logger_->GPUOn();
    /*
    DPCT1049:0: The workgroup size passed to the SYCL kernel may exceed the
    limit. To get the device limit, query info::device::max_work_group_size.
    Adjust the workgroup size if needed.
    */
    q_ct1.submit([&](sycl::handler &cgh) {
      auto input_buffer__ct0 = input_buffer_;
      auto output_buffer__ct1 = output_buffer_;
      auto coeff_buffer__ct2 = coeff_buffer_;
      auto history_buffer__ct3 = history_buffer_;
      auto num_tap__ct4 = num_tap_;
      auto num_data_per_block__ct5 = num_data_per_block_;

      cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                       [=](sycl::nd_item<3> item_ct1) {
                         fir_cuda(input_buffer__ct0, output_buffer__ct1,
                                  coeff_buffer__ct2, history_buffer__ct3,
                                  num_tap__ct4, num_data_per_block__ct5,
                                  item_ct1);
                       });
    });
    q_ct1
        .memcpy(output_ + count * num_data_per_block_, output_buffer_,
                num_data_per_block_ * sizeof(float))
        .wait();
    cpu_gpu_logger_->GPUOff();

    for (uint32_t i = 0; i < num_tap_; i++) {
      history_[i] = input_[count * num_data_per_block_ + num_data_per_block_ -
                           num_tap_ + i];
    }

    count++;
  }

  cpu_gpu_logger_->Summarize();
}

void FirCudaBenchmark::Cleanup() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  FirBenchmark::Cleanup();
  free(history_);
  sycl::free(output_buffer_, q_ct1);
  sycl::free(coeff_buffer_, q_ct1);
  sycl::free(input_buffer_, q_ct1);
  sycl::free(history_buffer_, q_ct1);
}
