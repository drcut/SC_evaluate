#!/bin/bash
set -e
llvm-as main-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as main-host-x86_64-unknown-linux-gnu.ll
kernelTranslator main-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator main-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime  -L$COX_BUILD_PATH/runtime/threadPool \
    -o myocyte.out -fPIC -no-pie host.o kernel.o \
    -lc -lx86Runtime -lthreadPool -lpthread -lm

./myocyte.out 100 1 0