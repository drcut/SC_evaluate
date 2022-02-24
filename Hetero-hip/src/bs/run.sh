hipify-clang cuda/bs_cuda_benchmark.cu --cuda-path=/usr/local/cuda \
    -I /usr/local/cuda/samples/common/inc \
    -I../.. -o cuda/bs_cuda_benchmark.cc
hipify-clang cuda/bs_cuda_benchmark.h --cuda-path=/usr/local/cuda  \
   -I /usr/local/cuda/samples/common/inc   \
   -I../.. -o cuda/bs_cuda_benchmark.h
g++ -o bs cuda/*.cc *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread -ltbb -fpermissive
./bs