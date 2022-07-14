#!/bin/bash
# set -e

#array=($(ls *.cu))
array="calc_dt_kernel_cuda"

# rm *.o *.bc
# rm -f *.s
# rm -f *.cui
for i in "${array[@]}"
do
	echo "$i"
    name=${i%".cu"}
    echo $name
    clang++ -std=c++11 $name.cu -fPIC \
         --cuda-path=/projects/tools/x86_64/ubuntu-20.04/cuda/10.2   \
         --cuda-gpu-arch=sm_50 -L/projects/tools/x86_64/ubuntu-20.04/cuda/10.2/lib64     \
         -lcudart_static -ldl -lrt -pthread -save-temps -v -DNO_ERR_CHK
done

for i in "${array[@]}"
do
	# echo "$i"
    name=${i%".cu"}
    echo $name
    kernelTranslator $name-cuda-nvptx64-nvidia-cuda-sm_50.bc $name"_kernel.bc"
    hostTranslator $name-host-x86_64-unknown-linux-gnu.bc $name"_host.bc"
    opt -O3 $name"_kernel.bc" -o $name"_opt_kernel.bc"
    opt -O3 $name"_host.bc" -o $name"_opt_host.bc"
done
llvm-link -o lib.bc *_opt_kernel.bc *_opt_host.bc
opt -O3 lib.bc -o opt_lib.bc
llc --relocation-model=pic --filetype=obj opt_lib.bc -o lib.o
make -j8
./clover_leaf
