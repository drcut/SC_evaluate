#!/bin/bash
set -e
clang++ -std=c++11 cuda/aes_cuda_benchmark.cu -I../.. --cuda-path=$CUDA_PATH \
    --cuda-gpu-arch=sm_50 -L$CUDA_PATH/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v || true

$CuPBoP_BUILD_PATH/compilation/kernelTranslator aes_cuda_benchmark-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
$CuPBoP_BUILD_PATH/compilation/hostTranslator aes_cuda_benchmark-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -o aes -fPIC -no-pie -L$CuPBoP_BUILD_PATH/runtime \
  -L$CuPBoP_BUILD_PATH/runtime/threadPool \
  cuda/main.cc host.o kernel.o *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread -lc -lx86Runtime -lthreadPool
export LD_LIBRARY_PATH=$CuPBoP_BUILD_PATH/runtime/threadPool:$LD_LIBRARY_PATH
time ./aes -i ../../data/aes/1GB.data -k ../../data/aes/key.data -q