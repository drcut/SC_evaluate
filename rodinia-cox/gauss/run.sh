#!/bin/bash
set -e
# llvm-as gaussian-cuda-nvptx64-nvidia-cuda-sm_61.ll
# llvm-as gaussian-host-x86_64-unknown-linux-gnu.ll
clang++ gaussian.cu -o gaussian --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator gaussian-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator gaussian-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

COX_BUILD_PATH=~/repo/open_source_template/build
g++ -Wall -L$COX_BUILD_PATH/runtime \
     -L$COX_BUILD_PATH/runtime/threadPool \
     -o gaussian -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

./gaussian -f ../../data/gaussian/matrix1024.txt
