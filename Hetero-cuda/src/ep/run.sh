nvcc -std=c++11 -o ep cuda/main.cc cuda/ep_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./ep -q -v