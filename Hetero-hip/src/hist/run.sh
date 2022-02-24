hipify-clang cuda/hist_cuda_benchmark.cu --cuda-path=/usr/local/cuda \
    -I /usr/local/cuda/samples/common/inc \
    -I../.. -o cuda/hist_cuda_benchmark.cc
g++ -o hist cuda/*.cc *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread -ltbb -fpermissive
./hist