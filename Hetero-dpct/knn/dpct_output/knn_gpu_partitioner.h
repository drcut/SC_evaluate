#include <CL/sycl.hpp>
#include <dpct/dpct.hpp>
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

#ifndef SRC_KNN_CUDA_KNN_GPU_PARTITIONER_H_
#define SRC_KNN_CUDA_KNN_GPU_PARTITIONER_H_

typedef struct GpuPartitioner {
  int n_data;
  int current;
  int *worklist;
} GpuPartitioner;

inline GpuPartitioner gpu_partitioner_create(int n_data, int *worklist) {
  GpuPartitioner p;
  p.n_data = n_data;
  p.worklist = worklist;
  return p;
}

inline int gpu_initialize(GpuPartitioner *p) {
  /*
  DPCT1007:0: Migration of this CUDA API is not supported by the Intel(R) DPC++
  Compatibility Tool.
  */
  p->current = (*p->worklist + 1);
  return p->current;
}

inline bool gpu_more(const GpuPartitioner *p) {
  return (p->current < p->n_data);
}

inline int gpu_increment(GpuPartitioner *p) {
  /*
  DPCT1007:1: Migration of this CUDA API is not supported by the Intel(R) DPC++
  Compatibility Tool.
  */
  p->current = (*p->worklist + 1);
  return p->current;
}

#endif  // SRC_KNN_CUDA_KNN_GPU_PARTITIONER_H_
