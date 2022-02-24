hipify-clang cuda/aes_cuda_benchmark.cu --cuda-path=/usr/local/cuda \
    -I /usr/local/cuda/samples/common/inc \
    -I../.. -o cuda/aes_cuda_benchmark.cc
g++ -o aes cuda/*.cc *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread -ltbb -fpermissive
./aes -i ../../data/aes/256KB.data -k ../../data/aes/key.data -q -v