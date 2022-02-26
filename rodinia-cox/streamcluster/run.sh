#!/bin/bash
set -e
llvm-as streamcluster_cuda_cpu-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as streamcluster_cuda_cpu-host-x86_64-unknown-linux-gnu.ll
kernelTranslator streamcluster_cuda_cpu-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator streamcluster_cuda_cpu-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime \
     -L$COX_BUILD_PATH/runtime/threadPool \
     -o sc_gpu -fPIC -no-pie host.o kernel.o \
     -lc -lx86Runtime -lthreadPool -lpthread
./sc_gpu 10 20 256 65536 65536 1000 none output.txt 1