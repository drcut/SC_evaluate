#!/bin/bash
set -e
clang++ euler3d.cu -I/usr/local/cuda-10.1/samples/common/inc \
    --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_50 \
    -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v
# llvm-as euler3d-host-x86_64-unknown-linux-gnu.ll
# llvm-as euler3d-cuda-nvptx64-nvidia-cuda-sm_50.ll
kernelTranslator euler3d-cuda-nvptx64-nvidia-cuda-sm_50.bc kernel.bc
hostTranslator euler3d-host-x86_64-unknown-linux-gnu.bc  host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -Wall -L$COX_BUILD_PATH/runtime  -L$COX_BUILD_PATH/runtime/threadPool \
    -o euler3d -fPIC -no-pie host.o kernel.o -lc \
    -lx86Runtime -lthreadPool -lpthread

./euler3d ../../data/cfd/fvcorr.domn.097K
