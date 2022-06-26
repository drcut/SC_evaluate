#!/bin/bash
set -e
clang -c -emit-llvm backprop.c
clang -c -emit-llvm facetrain.c
clang -c -emit-llvm imagenet.c

clang++ backprop_cuda.cu --cuda-path=$CUDA_PATH -I. \
    --cuda-gpu-arch=sm_61 -L$CUDA_PATH/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v || true

kernelTranslator backprop_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator backprop_cuda-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o
llc --relocation-model=pic --filetype=obj  backprop.bc
llc --relocation-model=pic --filetype=obj  facetrain.bc
llc --relocation-model=pic --filetype=obj  imagenet.bc

g++ -Wall -L$CuPBoP_BUILD_PATH/runtime \
     -L$CuPBoP_BUILD_PATH/runtime/threadPool -o backprop \
    -fPIC -no-pie host.o kernel.o backprop.o facetrain.o imagenet.o \
    -lc -lx86Runtime -lthreadPool -lpthread

time ./backprop 65536