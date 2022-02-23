nvcc -std=c++11 -o fir cuda/main.cc cuda/fir_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./fir -q -v