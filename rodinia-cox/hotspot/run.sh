#!/bin/bash
set -e
clang++ hotspot.cu -I$CUDA_PATH/samples/common/inc \
    --cuda-path=$CUDA_PATH --cuda-gpu-arch=sm_50 \
    -L$CUDA_PATH/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v || true

kernelTranslator hotspot-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
hostTranslator hotspot-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -Wall -L$CuPBoP_BUILD_PATH/runtime  -L$CuPBoP_BUILD_PATH/runtime/threadPool \
    -o hotspot -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread


time ./hotspot 1024 2 2 ../data/hotspot/temp_1024 ../data/hotspot/power_1024 output.out

