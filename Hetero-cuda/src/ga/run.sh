nvcc -std=c++11 -o ga cuda/main.cc cuda/ga_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./ga -q -v

