#!/bin/bash
set -e
llvm-as ex_particle_CUDA_naive_seq-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as ex_particle_CUDA_naive_seq-host-x86_64-unknown-linux-gnu.ll
kernelTranslator ex_particle_CUDA_naive_seq-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator ex_particle_CUDA_naive_seq-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -Wall -L$CuPBoP_BUILD_PATH/runtime  -L$CuPBoP_BUILD_PATH/runtime/threadPool \
    -o particlefilter_naive -fPIC -no-pie \
    host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
time ./particlefilter_naive -x 128 -y 128 -z 10 -np 20000