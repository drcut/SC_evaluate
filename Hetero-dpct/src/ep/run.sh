# dpct cuda/ep_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o ep cuda/main.cc dpct_output/ep_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
time ./ep -q


