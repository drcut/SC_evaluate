#!/bin/bash
set -e
llvm-as nn_cuda-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as nn_cuda-host-x86_64-unknown-linux-gnu.ll
kernelTranslator nn_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator nn_cuda-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime  -L$COX_BUILD_PATH/runtime/threadPool \
    -o nn -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

./nn filelist_4 -r 5 -lat 30 -lng 90