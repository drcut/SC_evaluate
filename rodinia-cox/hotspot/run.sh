#!/bin/bash
#set -e
#llvm-as hotspot-cuda-nvptx64-nvidia-cuda-sm_61.ll
#llvm-as hotspot-host-x86_64-unknown-linux-gnu.ll
clang++ hotspot.cu -I/usr/local/cuda-10.1/samples/common/inc \
    --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_50 \
    -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator hotspot-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
hostTranslator hotspot-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime  -L$COX_BUILD_PATH/runtime/threadPool \
    -o hotspot -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread


./hotspot 512 2 2 ../../data/hotspot/temp_512 \
    ../../data/hotspot/power_512 output.out

