# dpct cuda/pr_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o pr cuda/main.cc dpct_output/pr_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
time ./pr -i ../../data/pr/8192.data -q


