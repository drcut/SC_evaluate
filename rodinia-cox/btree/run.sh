#!/bin/bash
set -e
clang -c -emit-llvm util/timer/timer.c
clang -c -emit-llvm util/num/num.c
clang -c -emit-llvm util/cuda/cuda.cu --cuda-gpu-arch=sm_61
clang -c -emit-llvm kernel/kernel_gpu_cuda_wrapper.cu --cuda-gpu-arch=sm_61
clang++ kernel/kernel_gpu_cuda_wrapper.cu  --cuda-path=$CUDA_PATH \
    --cuda-gpu-arch=sm_61 -L$CUDA_PATH/lib64 -lcudart_static \
    -ldl -lrt -pthread -save-temps -v || true
clang++ kernel/kernel_gpu_cuda_wrapper_2.cu  \
    --cuda-path=$CUDA_PATH \
    --cuda-gpu-arch=sm_61 -L$CUDA_PATH/lib64 \
    -lcudart_static -ldl -lrt -pthread -save-temps -v || true
clang -c -emit-llvm main.c

kernelTranslator kernel_gpu_cuda_wrapper-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel1.bc
kernelTranslator kernel_gpu_cuda_wrapper_2-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel2.bc
hostTranslator kernel_gpu_cuda_wrapper-host-x86_64-unknown-linux-gnu.bc host1.bc
hostTranslator kernel_gpu_cuda_wrapper_2-host-x86_64-unknown-linux-gnu.bc host2.bc

opt -O3 kernel1.bc -o opt_kernel1.bc -force-vector-width=16
opt -O3 kernel2.bc -o opt_kernel2.bc -force-vector-width=16

llc --relocation-model=pic --filetype=obj  main.bc
llc --relocation-model=pic --filetype=obj  cuda.bc
llc --relocation-model=pic --filetype=obj  num.bc
llc --relocation-model=pic --filetype=obj  timer.bc
llc --relocation-model=pic --filetype=obj  opt_kernel1.bc -o kernel1.o
llc --relocation-model=pic --filetype=obj  opt_kernel2.bc -o kernel2.o
llc --relocation-model=pic --filetype=obj  host1.bc
llc --relocation-model=pic --filetype=obj  host2.bc
g++ -Wall -L$CuPBoP_BUILD_PATH/runtime  -L$CuPBoP_BUILD_PATH/runtime/threadPool -o b+tree.out \
    -fPIC -no-pie main.o host1.o host2.o kernel1.o kernel2.o cuda.o num.o timer.o \
    -lc -lx86Runtime -lthreadPool -lpthread

time ./b+tree.out file ../../data/b+tree/mil.txt \
    command ../../data/b+tree/command.txt