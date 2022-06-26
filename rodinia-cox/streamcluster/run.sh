# # #!/bin/bash
set -e

clang++ streamcluster_cuda.cu -I$CUDA_PATH/samples/common/inc \
     -I$CUDA_PATH/include \
    --cuda-path=$CUDA_PATH --cuda-gpu-arch=sm_61 \
    -L$CUDA_PATH/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v || true

kernelTranslator streamcluster_cuda-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator streamcluster_cuda-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc -force-vector-width=8

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -Wall -L$CuPBoP_BUILD_PATH/runtime  -L$CuPBoP_BUILD_PATH/runtime/threadPool -o sc_gpu \
     -I$CuPBoP_BUILD_PATH/../runtime/threadPool/include \
     -I$CuPBoP_BUILD_PATH/../runtime/include/x86 \
    -fPIC -no-pie streamcluster_cuda_cpu.cpp host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

time ./sc_gpu 10 20 256 65536 65536 1000 none output.txt 1


