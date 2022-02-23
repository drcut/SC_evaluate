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
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "src/hist/cuda/hist_cuda_benchmark.h"

void Histogram(uint32_t *pixels, uint32_t *histogram,
                          uint32_t num_colors, uint32_t num_pixels,
                          sycl::nd_item<3> item_ct1) {
  int tid = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
            item_ct1.get_local_id(2);
  int gsize = item_ct1.get_group_range(2) * item_ct1.get_local_range().get(2);

  if (tid >= num_pixels) {
    return;
  }

  uint32_t priv_hist[256];
  for (uint32_t i = 0; i < num_colors; i++) {
    priv_hist[i] = 0;
  }

  // Private histogram
  uint32_t index = tid;
  while (index < num_pixels) {
    uint32_t color = pixels[index];
    priv_hist[color]++;
    index += gsize;
  }

  /*
  DPCT1065:0: Consider replacing sycl::nd_item::barrier() with
  sycl::nd_item::barrier(sycl::access::fence_space::local_space) for better
  performance if there is no access to global memory.
  */
  item_ct1.barrier();

  // Copy to global memory
  for (uint32_t i = 0; i < num_colors; i++) {
    if (priv_hist[i] > 0) {
      /*
      DPCT1039:1: The generated code assumes that "histogram + i" points to the
      global memory address space. If it points to a local memory address space,
      replace "sycl::global_ptr" with "sycl::local_ptr".
      */
      sycl::atomic<uint32_t>(sycl::global_ptr<uint32_t>(histogram + i))
          .fetch_add(priv_hist[i]);
    }
  }
}

void HistCudaBenchmark::Initialize() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  HistBenchmark::Initialize();

  d_pixels_ = sycl::malloc_device<uint32_t>(num_pixel_, q_ct1);
  d_histogram_ = sycl::malloc_device<uint32_t>(num_color_, q_ct1);
}

void HistCudaBenchmark::Run() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  q_ct1.memcpy(d_pixels_, pixels_, num_pixel_ * sizeof(uint32_t)).wait();
  q_ct1.memset(d_histogram_, 0, num_color_ * sizeof(uint32_t)).wait();
  cpu_gpu_logger_->GPUOn();
  q_ct1.submit([&](sycl::handler &cgh) {
    auto d_pixels__ct0 = d_pixels_;
    auto d_histogram__ct1 = d_histogram_;
    auto num_color__ct2 = num_color_;
    auto num_pixel__ct3 = num_pixel_;

    cgh.parallel_for(sycl::nd_range<3>(sycl::range<3>(1, 1, 8192 / 64) *
                                           sycl::range<3>(1, 1, 64),
                                       sycl::range<3>(1, 1, 64)),
                     [=](sycl::nd_item<3> item_ct1) {
                       Histogram(d_pixels__ct0, d_histogram__ct1,
                                 num_color__ct2, num_pixel__ct3, item_ct1);
                     });
  });
  q_ct1.memcpy(histogram_, d_histogram_, num_color_ * sizeof(uint32_t)).wait();
  cpu_gpu_logger_->GPUOff();
  cpu_gpu_logger_->Summarize();
}

void HistCudaBenchmark::Cleanup() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  sycl::free(d_pixels_, q_ct1);
  sycl::free(d_histogram_, q_ct1);
  HistBenchmark::Cleanup();
}
