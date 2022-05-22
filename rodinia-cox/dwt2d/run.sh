

#!/bin/bash

clang++ -I. -I/include -fno-strict-aliasing dwt_cuda/fdwt53.cu dwt_cuda/fdwt97.cu  dwt_cuda/common.cu  dwt_cuda/rdwt97.cu  dwt_cuda/rdwt53.cu components.cu dwt.cu main.cu -c  --cuda-path=/usr/local/cuda-10.1 --cuda-gpu-arch=sm_50 -I. -I/include -L/usr/local/cuda-10.1/lib64 -lcudart_static -ldl -lrt -pthread -save-temps -v

kernelTranslator common-cuda-nvptx64-nvidia-cuda-sm_50.bc common.bc
kernelTranslator components-cuda-nvptx64-nvidia-cuda-sm_50.bc components.bc
kernelTranslator fdwt53-cuda-nvptx64-nvidia-cuda-sm_50.bc fdwt53.bc

kernelTranslator dwt-cuda-nvptx64-nvidia-cuda-sm_50.bc dwt.bc

kernelTranslator fdwt97-cuda-nvptx64-nvidia-cuda-sm_50.bc fdwt97.bc
kernelTranslator rdwt97-cuda-nvptx64-nvidia-cuda-sm_50.bc rdwt97.bc
kernelTranslator rdwt53-cuda-nvptx64-nvidia-cuda-sm_50.bc rdwt53.bc

hostTranslator main-host-x86_64-unknown-linux-gnu.bc host.bc
hostTranslator common-host-x86_64-unknown-linux-gnu.bc common_host.bc
hostTranslator components-host-x86_64-unknown-linux-gnu.bc components_host.bc
hostTranslator dwt-host-x86_64-unknown-linux-gnu.bc dwt_host.bc
hostTranslator fdwt53-host-x86_64-unknown-linux-gnu.bc fdwt53_host.bc

hostTranslator fdwt97-host-x86_64-unknown-linux-gnu.bc fdwt97_host.bc
hostTranslator rdwt53-host-x86_64-unknown-linux-gnu.bc rdwt53_host.bc
hostTranslator rdwt97-host-x86_64-unknown-linux-gnu.bc rdwt97_host.bc


llc --relocation-model=pic --filetype=obj  common.bc
llc --relocation-model=pic --filetype=obj  components.bc
llc --relocation-model=pic --filetype=obj  fdwt53.bc

llc --relocation-model=pic --filetype=obj  dwt.bc
llc --relocation-model=pic --filetype=obj  host.bc

llc --relocation-model=pic --filetype=obj  common_host.bc
llc --relocation-model=pic --filetype=obj  components_host.bc
llc --relocation-model=pic --filetype=obj  fdwt53_host.bc

llc --relocation-model=pic --filetype=obj  dwt_host.bc

llc --relocation-model=pic --filetype=obj  fdwt97_host.bc
llc --relocation-model=pic --filetype=obj  rdwt97_host.bc
llc --relocation-model=pic --filetype=obj  rdwt53_host.bc
llc --relocation-model=pic --filetype=obj  fdwt97.bc
llc --relocation-model=pic --filetype=obj  rdwt97.bc
llc --relocation-model=pic --filetype=obj  rdwt53.bc

g++ -Wall -L$COX_BUILD_PATH/runtime \
    -L$COX_BUILD_PATH/runtime/threadPool \
    -o dwt2d -fPIC -no-pie common.o components.o dwt.o fdwt53.o fdwt97.o rdwt97.o rdwt53.o host.o common_host.o components_host.o dwt_host.o fdwt53_host.o fdwt97_host.o rdwt97_host.o rdwt53_host.o -lc -lx86Runtime -lthreadPool -lpthread

./dwt2d 4.bmp  -d 4x4 -r -5 -l 3