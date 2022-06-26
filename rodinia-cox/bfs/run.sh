#!/bin/bash
set -e
clang++ bfs.cu --cuda-path=$CUDA_PATH  -I. \
    --cuda-gpu-arch=sm_61 -L$CUDA_PATH /lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v || true

kernelTranslator bfs-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator bfs-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -Wall -L$CuPBoP_BUILD_PATH/runtime  -L$CuPBoP_BUILD_PATH/runtime/threadPool \
    -o bfs.out -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

time ./bfs.out ../../data/bfs/graph1MW_6.txt