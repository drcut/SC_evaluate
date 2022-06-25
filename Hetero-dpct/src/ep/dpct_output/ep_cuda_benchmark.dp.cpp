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
#include "src/ep/cuda/ep_cuda_benchmark.h"

#include <cstdio>
#include <cstdlib>
#include <thread>
#include <vector>

void EpCudaBenchmark::Initialize() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  EpBenchmark::Initialize();
  d_island_ = sycl::malloc_device<Creature>(population_ / 2, q_ct1);
  d_fitness_func_ = sycl::malloc_device<double>(kNumVariables, q_ct1);
  q_ct1
      .memcpy(d_fitness_func_, fitness_function_,
              kNumVariables * sizeof(double))
      .wait();
}

void EpCudaBenchmark::Run() {
  if (pipelined_) {
    PipelinedRun();
  } else {
    NormalRun();
  }
  cpu_gpu_logger_->Summarize();
}

void EpCudaBenchmark::PipelinedRun() {
  seed_ = kSeedInitValue;
  ReproduceInIsland(&islands_1_);
  for (uint32_t i = 0; i < max_generation_; i++) {
    std::thread t1(&EpCudaBenchmark::ReproduceInIsland, this, &islands_2_);
    std::thread t2(&EpCudaBenchmark::EvaluateGpu, this, &islands_1_);
    t1.join();
    t2.join();

    std::thread t3(&EpCudaBenchmark::EvaluateGpu, this, &islands_2_);
    std::thread t4(&EpCudaBenchmark::SelectInIsland, this, &islands_1_);
    t4.join();
    result_island_1_ = islands_1_[0].fitness;
    std::thread t5(&EpCudaBenchmark::CrossoverInIsland, this, &islands_1_);
    t5.join();
    t3.join();

    std::thread t6(&EpCudaBenchmark::SelectInIsland, this, &islands_2_);
    std::thread t7(&EpCudaBenchmark::MutateGpu, this, &islands_1_);
    t6.join();
    result_island_2_ = islands_2_[0].fitness;
    std::thread t8(&EpCudaBenchmark::CrossoverInIsland, this, &islands_2_);
    t7.join();
    t8.join();

    std::thread t9(&EpCudaBenchmark::MutateGpu, this, &islands_2_);
    std::thread t10(&EpCudaBenchmark::ReproduceInIsland, this, &islands_1_);
    t9.join();
    t10.join();
  }
}

void EpCudaBenchmark::NormalRun() {
  seed_ = kSeedInitValue;
  for (uint32_t i = 0; i < max_generation_; i++) {
    Reproduce();
    EvaluateGpu(&islands_1_);
    EvaluateGpu(&islands_2_);
    Select();

    result_island_1_ = islands_1_[0].fitness;
    result_island_2_ = islands_2_[0].fitness;

    Crossover();
    MutateGpu(&islands_1_);
    MutateGpu(&islands_2_);
  }
}

void Evaluate_Kernel(Creature *creatures, double *fitness_function,
                                uint32_t count, uint32_t num_vars,
                                sycl::nd_item<3> item_ct1) {
  uint32_t i = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
               item_ct1.get_local_id(2);
  if (i >= count) return;

  double fitness = 0;
  Creature &creature = creatures[i];
  for (int j = 0; j < num_vars; j++) {
    double pow = 1;
    for (int k = 0; k < j + 1; k++) {
      pow *= creature.parameters[j];
    }
    fitness += pow * fitness_function[j];
  }
  creature.fitness = fitness;
}

void EpCudaBenchmark::EvaluateGpu(std::vector<Creature> *island) {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  q_ct1.memcpy(d_island_, island->data(), population_ / 2 * sizeof(Creature))
      .wait();
  sycl::range<3> block_size(1, 1, 64);
  sycl::range<3> grid_size(
      1, 1, (population_ / 2 * +block_size[2] - 1) / block_size[2]);
  cpu_gpu_logger_->GPUOn();
  /*
  DPCT1049:0: The workgroup size passed to the SYCL kernel may exceed the limit.
  To get the device limit, query info::device::max_work_group_size. Adjust the
  workgroup size if needed.
  */
  q_ct1.submit([&](sycl::handler &cgh) {
    auto d_island__ct0 = d_island_;
    auto d_fitness_func__ct1 = d_fitness_func_;
    auto population__ct2 = population_ / 2;
    auto kNumVariables_ct3 = kNumVariables;

    cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                     [=](sycl::nd_item<3> item_ct1) {
                       Evaluate_Kernel(d_island__ct0, d_fitness_func__ct1,
                                       population__ct2, kNumVariables_ct3,
                                       item_ct1);
                     });
  });
  q_ct1.memcpy(island->data(), d_island_, population_ / 2 * sizeof(Creature))
      .wait();
  cpu_gpu_logger_->GPUOff();
}

void Mutate_Kernel(Creature *creatures, uint32_t count,
                              uint32_t num_vars, sycl::nd_item<3> item_ct1) {
  uint32_t i = item_ct1.get_group(2) * item_ct1.get_local_range().get(2) +
               item_ct1.get_local_id(2);
  if (i >= count) return;

  if (i % 7 != 0) return;
  creatures[i].parameters[i % num_vars] *= 0.5;
}

void EpCudaBenchmark::MutateGpu(std::vector<Creature> *island) {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  q_ct1.memcpy(d_island_, island->data(), population_ / 2 * sizeof(Creature))
      .wait();
  sycl::range<3> block_size(1, 1, 64);
  sycl::range<3> grid_size(
      1, 1, (population_ / 2 * +block_size[2] - 1) / block_size[2]);
  cpu_gpu_logger_->GPUOn();
  /*
  DPCT1049:1: The workgroup size passed to the SYCL kernel may exceed the limit.
  To get the device limit, query info::device::max_work_group_size. Adjust the
  workgroup size if needed.
  */
  q_ct1.submit([&](sycl::handler &cgh) {
    auto d_island__ct0 = d_island_;
    auto population__ct1 = population_ / 2;
    auto kNumVariables_ct2 = kNumVariables;

    cgh.parallel_for(sycl::nd_range<3>(grid_size * block_size, block_size),
                     [=](sycl::nd_item<3> item_ct1) {
                       Mutate_Kernel(d_island__ct0, population__ct1,
                                     kNumVariables_ct2, item_ct1);
                     });
  });
  q_ct1.memcpy(island->data(), d_island_, population_ / 2 * sizeof(Creature))
      .wait();
  cpu_gpu_logger_->GPUOff();
}

void EpCudaBenchmark::Cleanup() {
  dpct::device_ext &dev_ct1 = dpct::get_current_device();
  sycl::queue &q_ct1 = dev_ct1.default_queue();
  sycl::free(d_island_, q_ct1);
  sycl::free(d_fitness_func_, q_ct1);
  EpBenchmark::Cleanup();
}
