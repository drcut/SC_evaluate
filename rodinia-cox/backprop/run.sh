#!/bin/bash
clang -c -emit-llvm backprop.c
clang -c -emit-llvm facetrain.c
clang -c -emit-llvm imagenet.c

#llvm-as backprop_cuda-cuda-nvptx64-nvidia-cuda-sm_61.ll
#llvm-as backprop_cuda-host-x86_64-unknown-linux-gnu.ll
clang++ backprop_cuda.cu --cuda-path=/usr/local/cuda-10.1 -I. \
    --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator backprop_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator backprop_cuda-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
llc --relocation-model=pic --filetype=obj  backprop.bc
llc --relocation-model=pic --filetype=obj  facetrain.bc
llc --relocation-model=pic --filetype=obj  imagenet.bc
COX_BUILD_PATH=~/repo/open_source_template/build
g++ -Wall -L$COX_BUILD_PATH/runtime \
     -L$COX_BUILD_PATH/runtime/threadPool -o demo \
    -fPIC -no-pie host.o kernel.o backprop.o facetrain.o imagenet.o \
    -lc -lx86Runtime -lthreadPool -lpthread

./demo 65536