dpct cuda/pr_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o pr cuda/main.cc dpct_output/pr_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
./pr -i ../../data/pr/64.data -q -v


