#!/bin/bash

clang++ -std=c++11 cuda/bs_cuda_benchmark.cu -I../.. --cuda-path=/usr/local/cuda-10.1 \
    --cuda-gpu-arch=sm_50 -L/usr/local/cuda-10.1/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator bs_cuda_benchmark-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
hostTranslator bs_cuda_benchmark-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -o bs -fPIC -no-pie -L/home/robinhan/repo/open_source_template/build/runtime \
  -L/home/robinhan/repo/open_source_template/build/runtime/threadPool \
  cuda/main.cc host.o kernel.o *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -I/home/robinhan/repo/open_source_template/runtime/include/ \
  -I../.. -I/home/robinhan/repo/open_source_template/runtime/threadPool/include/ \
 -lpthread -lc -lx86Runtime -lthreadPool

./bs -q -v