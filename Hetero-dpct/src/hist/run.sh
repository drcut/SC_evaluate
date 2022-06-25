# dpct cuda/hist_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o hist cuda/main.cc dpct_output/hist_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
time ./hist -x 4194304 -r 100 -q
