#!/bin/bash
set -e
llvm-as lud_kernel-cuda-nvptx64-nvidia-cuda-sm_50.ll
llvm-as lud_kernel-host-x86_64-unknown-linux-gnu.ll
llvm-as common-host-x86_64-unknown-linux-gnu.ll
llvm-as lud-host-x86_64-unknown-linux-gnu.ll
kernelTranslator lud_kernel-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
hostTranslator lud_kernel-host-x86_64-unknown-linux-gnu.bc kernel_host.bc

opt -O3 kernel_host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o kernel_host.o
llc --relocation-model=pic --filetype=obj  lud-host-x86_64-unknown-linux-gnu.bc -o host.o
llc --relocation-model=pic --filetype=obj  common-host-x86_64-unknown-linux-gnu.bc -o common.o

g++ -Wall -L$CuPBoP_BUILD_PATH/runtime \
     -L$CuPBoP_BUILD_PATH/runtime/threadPool \
     -o lud_cuda -fPIC -no-pie host.o kernel_host.o \
     kernel.o common.o -lc -lx86Runtime -lthreadPool -lpthread

time ./lud_cuda -s 2048