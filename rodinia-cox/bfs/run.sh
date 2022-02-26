#!/bin/bash
# set -e
# llvm-as bfs-cuda-nvptx64-nvidia-cuda-sm_61.ll
# llvm-as bfs-host-x86_64-unknown-linux-gnu.ll
clang++ bfs.cu --cuda-path=/usr/local/cuda-10.1 -I. \
    --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator bfs-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator bfs-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime  -L$COX_BUILD_PATH/runtime/threadPool \
    -o bfs.out -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

./bfs.out ../../data/bfs/graph1MW_6.txt