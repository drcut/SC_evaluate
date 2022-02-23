dpct cuda/bst_cuda_benchmark.cu cuda/bst_cuda_benchmark.h --extra-arg="-I../.."
dpcpp -o bs cuda/main.cc dpct_output/bst_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../..
./bs -v -q

