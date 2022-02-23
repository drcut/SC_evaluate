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
    this list of conditions and the following disclaimers.
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
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <cstdlib>
#include "src/kmeans/cuda/kmeans_cuda_benchmark.h"

void kmeans_swap_cuda(float *feature, float *feature_swap,
                                 int npoints, int nfeatures,
                                 sycl::nd_item<3> item_ct1) {
  uint32_t tid = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
                 item_ct1.get_local_id(2);
  if (tid >= npoints) return;

  for (int i = 0; i < nfeatures; i++)
    feature_swap[i * npoints + tid] = feature[tid * nfeatures + i];
}

void kmeans_compute_cuda(float *feature, float *clusters,
                                    int *membership, int npoints, int nclusters,
                                    int nfeatures, int offset, int size,
                                    sycl::nd_item<3> item_ct1) {
  uint32_t point_id =
      item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
      item_ct1.get_local_id(2);
  if (point_id > npoints) return;

  int index = 0;
  if (point_id < npoints) {
    float min_dist = FLT_MAX;
    for (int i = 0; i < nclusters; i++) {
      float dist = 0;
      float ans = 0;
      for (int l = 0; l < nfeatures; l++) {
        ans += (feature[l * npoints + point_id] - clusters[i * nfeatures + l]) *
               (feature[l * npoints + point_id] - clusters[i * nfeatures + l]);
      }

      dist = ans;
      if (dist < min_dist) {
        min_dist = dist;
        index = i;
      }
    }
    membership[point_id] = index;
  }

  return;
}

void KmeansCudaBenchmark::Initialize() {
  KmeansBenchmark::Initialize();

  InitializeBuffers();
}

void KmeansCudaBenchmark::InitializeBuffers() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  device_membership_ = sycl::malloc_device<int>(num_points_, q_ct1);
  device_features_ =
      sycl::malloc_device<float>(num_points_ * num_features_, q_ct1);
  device_features_swap_ =
      sycl::malloc_device<float>(num_points_ * num_features_, q_ct1);
}

void KmeansCudaBenchmark::CreateTemporaryMemory() {
  device_clusters_ = sycl::malloc_device<float>(num_clusters_ * num_features_,
                                                dpct::get_default_queue());
}

void KmeansCudaBenchmark::FreeTemporaryMemory() {
  sycl::free(device_clusters_, dpct::get_default_queue());
}

void KmeansCudaBenchmark::Clustering() {
  min_rmse_ = FLT_MAX;
  membership_ = new int[num_points_];

  // Sweep k from min to max_clusters_ to find the best number of clusters
  for (num_clusters_ = min_num_clusters_; num_clusters_ <= max_num_clusters_;
       num_clusters_++) {
    // Sanity check: cannot have more clusters than points
    if (num_clusters_ > num_points_) break;

    CreateTemporaryMemory();
    TransposeFeatures();
    KmeansClustering(num_clusters_);

    float rmse = CalculateRMSE();
    if (rmse < min_rmse_) {
      min_rmse_ = rmse;
      best_num_clusters_ = num_clusters_;
    }
    FreeTemporaryMemory();
  }

  delete[] membership_;
}

void KmeansCudaBenchmark::TransposeFeatures() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  q_ct1
      .memcpy(device_features_, host_features_,
              num_points_ * num_features_ * sizeof(float))
      .wait();

  sycl::range<3> block_size(1, 1, 64);
  sycl::range<3> grid_size(1, 1,
                           (num_points_ + block_size[2] - 1) / block_size[2]);

  cpu_gpu_logger_->GPUOn();
  /*
  DPCT1049:0: The workgroup size passed to the SYCL kernel may exceed the limit.
  To get the device limit, query info::device::max_work_group_size. Adjust the
  workgroup size if needed.
  */
  q_ct1.submit([&](sycl::handler &cgh) {
    auto device_features__ct0 = device_features_;
    auto device_features_swap__ct1 = device_features_swap_;
    auto num_points__ct2 = num_points_;
    auto num_features__ct3 = num_features_;

    cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                     [=](sycl::nd_item<3> item_ct1) {
                       kmeans_swap_cuda(
                           device_features__ct0, device_features_swap__ct1,
                           num_points__ct2, num_features__ct3, item_ct1);
                     });
  });
  dev_ct1.queues_wait_and_throw();
  cpu_gpu_logger_->GPUOff();
}

void KmeansCudaBenchmark::KmeansClustering(unsigned num_clusters) {
  unsigned num_iteration = 0;

  // that would guarantee a cluster without points
  if (num_clusters > num_points_) {
    printf("# of clusters cannot be less than # of points\n");
    exit(-1);
  }

  InitializeClusters(num_clusters);
  InitializeMembership();

  // iterate until converge
  do {
    UpdateMembership(num_clusters);
    UpdateClusterCentroids(num_clusters);
    num_iteration++;
  } while ((delta_ > 0) && (num_iteration < 500));

  printf("iterated %d times\n", num_iteration);
}

void KmeansCudaBenchmark::UpdateMembership(unsigned num_clusters) {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  int *new_membership = new int[num_points_];

  sycl::range<3> block_size(1, 1, 64);
  sycl::range<3> grid_size(1, 1,
                           (num_points_ + block_size[2] - 1) / block_size[2]);

  q_ct1
      .memcpy(device_clusters_, clusters_,
              num_clusters_ * num_features_ * sizeof(float))
      .wait();

  int size = 0;
  int offset = 0;

  cpu_gpu_logger_->GPUOn();
  /*
  DPCT1049:1: The workgroup size passed to the SYCL kernel may exceed the limit.
  To get the device limit, query info::device::max_work_group_size. Adjust the
  workgroup size if needed.
  */
  q_ct1.submit([&](sycl::handler &cgh) {
    auto device_features_swap__ct0 = device_features_swap_;
    auto device_clusters__ct1 = device_clusters_;
    auto device_membership__ct2 = device_membership_;
    auto num_points__ct3 = num_points_;
    auto num_clusters__ct4 = num_clusters_;
    auto num_features__ct5 = num_features_;

    cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                     [=](sycl::nd_item<3> item_ct1) {
                       kmeans_compute_cuda(
                           device_features_swap__ct0, device_clusters__ct1,
                           device_membership__ct2, num_points__ct3,
                           num_clusters__ct4, num_features__ct5, offset, size,
                           item_ct1);
                     });
  });

  q_ct1.memcpy(new_membership, device_membership_, num_points_ * sizeof(int))
      .wait();
  cpu_gpu_logger_->GPUOff();

  cpu_gpu_logger_->CPUOn();
  delta_ = 0.0f;
  for (unsigned int i = 0; i < num_points_; i++) {
    /* printf("number %d, merbership %d\n", i, new_membership[i]); */
    if (new_membership[i] != membership_[i]) {
      delta_++;
      membership_[i] = new_membership[i];
    }
  }
  cpu_gpu_logger_->CPUOff();
}

void KmeansCudaBenchmark::Run() {
  Clustering();
  cpu_gpu_logger_->Summarize();
}

void KmeansCudaBenchmark::Cleanup() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  sycl::free(device_membership_, q_ct1);
  sycl::free(device_features_, q_ct1);
  sycl::free(device_features_swap_, q_ct1);
}
