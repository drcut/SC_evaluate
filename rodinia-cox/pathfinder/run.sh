#!/bin/bash
set -e
llvm-as pathfinder-cuda-nvptx64-nvidia-cuda-sm_61.ll
llvm-as pathfinder-host-x86_64-unknown-linux-gnu.ll
kernelTranslator pathfinder-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator pathfinder-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime \
     -L$COX_BUILD_PATH/runtime/threadPool -o pathfinder \
    -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

./pathfinder 100000 100 20