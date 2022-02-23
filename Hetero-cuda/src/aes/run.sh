nvcc -std=c++11 -o aes cuda/main.cc cuda/aes_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./aes -i ../../data/aes/1KB.data -k ../../data/aes/key.data -q -v