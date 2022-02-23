nvcc -std=c++11 -o bs cuda/main.cc cuda/bs_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./bs