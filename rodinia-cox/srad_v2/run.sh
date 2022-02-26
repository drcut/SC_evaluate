#!/bin/bash
set -e
llvm-as srad-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as srad-host-x86_64-unknown-linux-gnu.ll
kernelTranslator srad-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator srad-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime \
     -L$COX_BUILD_PATH/runtime/threadPool \
     -o srad -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread
./srad 2048 2048 0 127 0 127 0.5 2