# dpct cuda/bs_cuda_benchmark.cu cuda/bs_cuda_benchmark.h --extra-arg="-I../.."
dpcpp -o bs cuda/main.cc dpct_output/bs_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../..
time ./bs -x 2097152 -q -r 20
