# # #!/bin/bash
set -e

clang++ 3D.cu -I$CUDA_PATH/samples/common/inc \
    --cuda-path=$CUDA_PATH --cuda-gpu-arch=sm_61 \
    -L$CUDA_PATH/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v || true

kernelTranslator 3D-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator 3D-host-x86_64-unknown-linux-gnu.bc host.bc

opt -O3 host.bc -o opt_host.bc
opt -O3 kernel.bc -o opt_kernel.bc

llc --relocation-model=pic --filetype=obj  opt_kernel.bc -o kernel.o
llc --relocation-model=pic --filetype=obj  opt_host.bc -o host.o

g++ -g -Wall -L$CuPBoP_BUILD_PATH/runtime  -L$CuPBoP_BUILD_PATH/runtime/threadPool -o 3D \
    -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

time ./3D 512 8 100 ../data/hotspot3D/power_512x8 ../data/hotspot3D/temp_512x8 output.out
