#!/bin/bash
clang++ kernel/kernel_gpu_cuda_wrapper.cu \
     --cuda-path=/usr/local/cuda-10.1 \
     --cuda-gpu-arch=sm_61 -L/usr/local/cuda-10.1/lib64 \
     -lcudart_static -ldl -lrt -pthread -save-temps -v


kernelTranslator kernel_gpu_cuda_wrapper-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator kernel_gpu_cuda_wrapper-host-x86_64-unknown-linux-gnu.bc host.bc
llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc
# llc --relocation-model=pic --filetype=obj  kernel.ll

export COX_BUILD_PATH=~/repo/open_source_template/build
g++ -Wall -L$COX_BUILD_PATH/runtime \
     -L$COX_BUILD_PATH/runtime/threadPool \
     -o lavaMD -fPIC -no-pie main.c host.o kernel.o util/timer/timer.c util/num/num.c -lc -lx86Runtime -lthreadPool -lpthread

./lavaMD -boxes1d 10