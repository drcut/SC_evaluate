# # #!/bin/bash
# set -e
# llvm-as 3D-cuda-nvptx64-nvidia-cuda-sm_61.ll
# llvm-as 3D-host-x86_64-unknown-linux-gnu.ll

clang++ 3D.cu -I/usr/local/cuda-10.1/samples/common/inc \
    --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_61 \
    -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator 3D-cuda-nvptx64-nvidia-cuda-sm_61.bc kernel.bc
hostTranslator 3D-host-x86_64-unknown-linux-gnu.bc host.bc

llc --relocation-model=pic --filetype=obj  kernel.bc
llc --relocation-model=pic --filetype=obj  host.bc

g++ -g -Wall -L$COX_BUILD_PATH/runtime  -L$COX_BUILD_PATH/runtime/threadPool -o 3D \
    -fPIC -no-pie host.o kernel.o -lc -lx86Runtime -lthreadPool -lpthread

./3D 512 8 100 ../../data/hotspot3D/power_512x8 ../../data/hotspot3D/temp_512x8 output.out
