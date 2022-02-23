nvcc -std=c++11 -o pr cuda/main.cc cuda/pr_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./pr -i ../../data/pr/64.data -q -v

