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


#include <hip/hip_runtime.h>
#include "src/fir/cuda/fir_cuda_benchmark.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>

__global__ void fir_cuda(float *input, float *output, float *coeff,
                         float *history, uint32_t num_tap, uint32_t num_data) {
  uint32_t tid = blockIdx.x * blockDim.x + threadIdx.x;
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
  history_ = reinterpret_cast<float *>(malloc(num_tap_ * sizeof(float)));
  hipMalloc(&input_buffer_, sizeof(float) * num_data_per_block_);
  hipMalloc(&output_buffer_, sizeof(float) * num_data_per_block_);
  hipMalloc(&coeff_buffer_, sizeof(float) * num_tap_);
  hipMalloc(&history_buffer_, sizeof(float) * num_tap_);
}

void FirCudaBenchmark::InitializeData() {
  for (unsigned i = 0; i < num_tap_; i++) {
    history_[i] = 0.0;
  }

  hipMemcpy(history_buffer_, history_, num_tap_ * sizeof(float),
             hipMemcpyHostToDevice);
  hipMemcpy(coeff_buffer_, coeff_, num_tap_ * sizeof(float),
             hipMemcpyHostToDevice);
}

void FirCudaBenchmark::Run() {
  unsigned int count = 0;

  for (unsigned i = 0; i < num_tap_; i++) {
    history_[i] = 0.0;
  }
  hipMemcpy(history_buffer_, history_, num_tap_ * sizeof(float),
             hipMemcpyHostToDevice);

  dim3 grid_size(num_data_per_block_ / 64);
  dim3 block_size(64);

  while (count < num_block_) {
    hipMemcpy(input_buffer_, input_ + (count * num_data_per_block_),
               (num_data_per_block_) * sizeof(float), hipMemcpyHostToDevice);
    hipMemcpy(history_buffer_, history_, num_tap_ * sizeof(float),
               hipMemcpyHostToDevice);
    cpu_gpu_logger_->GPUOn();
    hipLaunchKernelGGL(fir_cuda, dim3(grid_size), dim3(block_size), 0, 0, input_buffer_, output_buffer_,
                                        coeff_buffer_, history_buffer_,
                                        num_tap_, num_data_per_block_);
    hipMemcpy(output_ + count * num_data_per_block_, output_buffer_,
               num_data_per_block_ * sizeof(float), hipMemcpyDeviceToHost);
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
  FirBenchmark::Cleanup();
  free(history_);
  hipFree(output_buffer_);
  hipFree(coeff_buffer_);
  hipFree(input_buffer_);
  hipFree(history_buffer_);
}
