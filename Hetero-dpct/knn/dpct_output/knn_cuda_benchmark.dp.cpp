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
 * CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS WITH THE SOFTWARE.
 */

#include <CL/sycl.hpp>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dpct/dpct.hpp>
#include "src/knn/dpct_output/knn_cpu_partitioner.h"
#include "src/knn/dpct_output/knn_cuda_benchmark.h"
#include "src/knn/dpct_output/knn_gpu_partitioner.h"

void knn_cuda(LatLong *latLong, float *d_distances, int num_gpu_records,
              int num_records, float lat, float lng, int *gpu_worklist,
              int *cpu_worklist) {
  GpuPartitioner p = gpu_partitioner_create(num_gpu_records, gpu_worklist);

  for (int tid = gpu_initialize(&p); gpu_more(&p); tid = gpu_increment(&p)) {
    d_distances[tid] = static_cast<float>(
        sycl::sqrt((lat - latLong[tid].lat) * (lat - latLong[tid].lat) +
                   (lng - latLong[tid].lng) * (lng - latLong[tid].lng)));
  }

  GpuPartitioner thieves = gpu_partitioner_create(num_records, cpu_worklist);

  for (int tid = gpu_initialize(&thieves); gpu_more(&thieves);
       tid = gpu_increment(&thieves)) {
    d_distances[tid] = static_cast<float>(
        sycl::sqrt((lat - latLong[tid].lat) * (lat - latLong[tid].lat) +
                   (lng - latLong[tid].lng) * (lng - latLong[tid].lng)));
  }
}

void KnnCudaBenchmark::Initialize() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  KnnBenchmark::Initialize();
  h_locations_ = sycl::malloc_shared<LatLong>(num_records_, q_ct1);
  h_distances_ = sycl::malloc_shared<float>(num_records_, q_ct1);
  cpu_worklist_ =
      (std::atomic_int *)sycl::malloc_shared(sizeof(std::atomic_uint), q_ct1);
  gpu_worklist_ =
      (std::atomic_int *)sycl::malloc_shared(sizeof(std::atomic_uint), q_ct1);
  for (int i = 0; i < num_records_; i++) {
    h_locations_[i].lat = locations_.at(i).lat;
    h_locations_[i].lng = locations_.at(i).lng;
  }

  gpu_worklist_[0].store(0);
  cpu_worklist_[0].store(partitioning_ * num_records_);
}

void KnnCudaBenchmark::Run() {
  sycl::range<3> block_size(1, 1, 256);
  sycl::range<3> grid_size(1, 1, 1);
  int num_gpu_records = partitioning_ * num_records_;
  int num_cpu_records = (1 - partitioning_) * num_records_;
  printf("Num gpu records is %d \n", num_gpu_records);
  printf("Num cpu records is %d \n", num_cpu_records);

  /*
  DPCT1049:2: The workgroup size passed to the SYCL kernel may exceed the limit.
  To get the device limit, query info::device::max_work_group_size. Adjust the
  workgroup size if needed.
  */
  dpct::get_default_queue().submit([&](sycl::handler &cgh) {
    auto h_locations__ct0 = h_locations_;
    auto h_distances__ct1 = h_distances_;
    auto num_records__ct3 = num_records_;
    auto latitude__ct4 = latitude_;
    auto longitude__ct5 = longitude_;
    auto gpu_worklist__ct6 = (int *)gpu_worklist_;
    auto cpu_worklist__ct7 = (int *)cpu_worklist_;

    cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                     [=](sycl::nd_item<3> item_ct1) {
                       knn_cuda(h_locations__ct0, h_distances__ct1,
                                num_gpu_records, num_records__ct3,
                                latitude__ct4, longitude__ct5,
                                gpu_worklist__ct6, cpu_worklist__ct7);
                     });
  });
  KnnCPU(h_locations_, h_distances_, num_records_, num_gpu_records, latitude_,
         longitude_, cpu_worklist_, gpu_worklist_);
  dpct::get_current_device().queues_wait_and_throw();

  for (int i = 0; i < 10; i++) {
    printf("Distances are %f \n", h_distances_[i]);
  }

  // find the resultsCount least distances
  findLowest(&records_, h_distances_, num_records_, k_value_);

  for (int i = 0; i < k_value_; i++) {
    printf("%s --> Distance=%f\n", records_[i].recString, records_[i].distance);
  }
}

void KnnCudaBenchmark::Cleanup() { KnnBenchmark::Cleanup(); }
