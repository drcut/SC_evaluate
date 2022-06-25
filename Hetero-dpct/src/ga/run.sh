# dpct cuda/ga_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o ga cuda/main.cc dpct_output/ga_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
time ./ga -i ../../data/ga/65536_1024.data -q




