#!/bin/bash
# set -e
clang++ main_test_cu.cu  --cuda-path=/usr/local/cuda-10.1 \
     --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 \
     -lcudart_static -ldl -lrt -pthread -save-temps -v
clang -c -emit-llvm cpuencode.cpp
llvm-as main_test_cu-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as main_test_cu-host-x86_64-unknown-linux-gnu.ll

kernelTranslator main_test_cu-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator main_test_cu-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
llc --relocation-model=pic --filetype=obj  cpuencode.bc

g++ -Wall -L$COX_BUILD_PATH/runtime \
     -L$COX_BUILD_PATH/runtime/threadPool -o pavle \
     -fPIC -no-pie host.o kernel.o cpuencode.o -lc -lx86Runtime -lthreadPool -lpthread

./pavle ../../data/huffman/test1024_H2.206587175259.in
