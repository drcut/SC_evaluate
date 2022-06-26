#!/bin/bash
set -e

clang++ nn_cuda.cu -I$CUDA_PATH/samples/common/inc \
    --cuda-path=$CUDA_PATH --cuda-gpu-arch=sm_61 \
    -L$CUDA_PATH/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v || true

kernelTranslator nn_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator nn_cuda-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -Wall -L$CuPBoP_BUILD_PATH/runtime  -L$CuPBoP_BUILD_PATH/runtime/threadPool -o nn \
    -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

time ./nn /nethome/rhan38/Intel_PPoPP_evaluate/SC_evaluate/rodinia-dpcpp/data/nn/filelist.txt -r 5 -lat 30 -lng 90


