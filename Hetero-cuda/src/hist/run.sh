nvcc -std=c++11 -o hist cuda/main.cc cuda/hist_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./hist -q -v

