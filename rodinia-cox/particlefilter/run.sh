#!/bin/bash
set -e
llvm-as ex_particle_CUDA_naive_seq-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as ex_particle_CUDA_naive_seq-host-x86_64-unknown-linux-gnu.ll
kernelTranslator ex_particle_CUDA_naive_seq-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator ex_particle_CUDA_naive_seq-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime  -L$COX_BUILD_PATH/runtime/threadPool \
    -o particlefilter_naive -fPIC -no-pie \
    host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
./particlefilter_naive -x 128 -y 128 -z 10 -np 1000