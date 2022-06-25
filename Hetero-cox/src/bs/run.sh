#!/bin/bash
set -e
clang++ -std=c++11 cuda/bs_cuda_benchmark.cu -I../.. --cuda-path=$CUDA_PATH \
    --cuda-gpu-arch=sm_50 -L$CUDA_PATH/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v || true

kernelTranslator bs_cuda_benchmark-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
hostTranslator bs_cuda_benchmark-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -o bs -fPIC -no-pie -L$CuPBoP_BUILD_PATH/runtime \
  -L$CuPBoP_BUILD_PATH/runtime/threadPool \
  cuda/main.cc host.o kernel.o *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -I$CuPBoP_BUILD_PATH/../runtime/include/ \
  -I../.. -I$CuPBoP_BUILD_PATH/../runtime/threadPool/include/ \
 -lpthread -lc -lx86Runtime -lthreadPool
export LD_LIBRARY_PATH=$CuPBoP_BUILD_PATH/runtime/threadPool:$LD_LIBRARY_PATH
time ./bs -x 2097152 -q -r 20