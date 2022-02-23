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
#include "src/pr/cuda/pr_cuda_benchmark.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>

void PrCudaBenchmark::Initialize() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  PrBenchmark::Initialize();

  device_row_offsets = sycl::malloc_device<uint32_t>((num_nodes_ + 1), q_ct1);
  device_column_numbers =
      sycl::malloc_device<uint32_t>((num_connections_), q_ct1);
  device_values = sycl::malloc_device<float>((num_connections_), q_ct1);
  device_mtx_1 = sycl::malloc_device<float>((num_nodes_), q_ct1);
  device_mtx_2 = sycl::malloc_device<float>((num_nodes_), q_ct1);
}

void pr_cuda(uint32_t *device_row_offsets,
                        uint32_t *device_column_numbers, float *device_values,
                        float *device_mtx_1, float *device_mtx_2,
                        sycl::nd_item<3> item_ct1) {
  uint tid = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
             item_ct1.get_local_id(2);
  uint32_t initialize = device_row_offsets[tid];
  uint32_t limit = device_row_offsets[tid + 1];
  float new_value = 0;
  for (uint32_t j = initialize; j < limit; j++) {
    uint32_t index = device_column_numbers[j];
    new_value += device_values[j] * device_mtx_1[index];
  }
  device_mtx_2[tid] = new_value;
}

void PrCudaBenchmark::Run() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  uint32_t i;

  q_ct1.memcpy(device_row_offsets, row_offsets_,
               (num_nodes_ + 1) * sizeof(uint32_t));
  q_ct1.memcpy(device_column_numbers, column_numbers_,
               (num_connections_) * sizeof(uint32_t));
  q_ct1.memcpy(device_values, values_, (num_connections_) * sizeof(float))
      .wait();

  sycl::range<3> block_size(1, 1, 64);
  sycl::range<3> grid_size(1, 1, num_nodes_ / 64);

  float *temp_mtx =
      reinterpret_cast<float *>(malloc(num_nodes_ * sizeof(float)));
  for (i = 0; i < num_nodes_; i++) {
    temp_mtx[i] = 1.0 / num_nodes_;
  }
  q_ct1.memcpy(device_mtx_1, temp_mtx, num_nodes_ * sizeof(float)).wait();
  free(temp_mtx);

  cpu_gpu_logger_->GPUOn();
  for (i = 0; i < max_iteration_; i++) {
    if (i % 2 == 0) {
      /*
      DPCT1049:0: The workgroup size passed to the SYCL kernel may exceed the
      limit. To get the device limit, query info::device::max_work_group_size.
      Adjust the workgroup size if needed.
      */
      q_ct1.submit([&](sycl::handler &cgh) {
        auto device_row_offsets_ct0 = device_row_offsets;
        auto device_column_numbers_ct1 = device_column_numbers;
        auto device_values_ct2 = device_values;
        auto device_mtx_1_ct3 = device_mtx_1;
        auto device_mtx_2_ct4 = device_mtx_2;

        cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                         [=](sycl::nd_item<3> item_ct1) {
                           pr_cuda(device_row_offsets_ct0,
                                   device_column_numbers_ct1, device_values_ct2,
                                   device_mtx_1_ct3, device_mtx_2_ct4,
                                   item_ct1);
                         });
      });
    } else {
      /*
      DPCT1049:1: The workgroup size passed to the SYCL kernel may exceed the
      limit. To get the device limit, query info::device::max_work_group_size.
      Adjust the workgroup size if needed.
      */
      q_ct1.submit([&](sycl::handler &cgh) {
        auto device_row_offsets_ct0 = device_row_offsets;
        auto device_column_numbers_ct1 = device_column_numbers;
        auto device_values_ct2 = device_values;
        auto device_mtx_2_ct3 = device_mtx_2;
        auto device_mtx_1_ct4 = device_mtx_1;

        cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                         [=](sycl::nd_item<3> item_ct1) {
                           pr_cuda(device_row_offsets_ct0,
                                   device_column_numbers_ct1, device_values_ct2,
                                   device_mtx_2_ct3, device_mtx_1_ct4,
                                   item_ct1);
                         });
      });
    }
  }

  if (i % 2 != 0) {
    q_ct1.memcpy(page_rank_, device_mtx_1, num_nodes_ * sizeof(float)).wait();
  } else {
    q_ct1.memcpy(page_rank_, device_mtx_2, num_nodes_ * sizeof(float)).wait();
  }
  cpu_gpu_logger_->GPUOff();
  cpu_gpu_logger_->Summarize();
}

void PrCudaBenchmark::Cleanup() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  sycl::free(device_row_offsets, q_ct1);
  sycl::free(device_column_numbers, q_ct1);
  sycl::free(device_values, q_ct1);
  sycl::free(device_mtx_1, q_ct1);
  sycl::free(device_mtx_2, q_ct1);

  PrBenchmark::Cleanup();
}
