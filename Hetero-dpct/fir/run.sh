dpct cuda/ga_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o ga cuda/main.cc dpct_output/ga_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
 ./ga -i ../../data/ga/1024_64.data -v -q