dpct cuda/aes_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o aes cuda/main.cc dpct_output/aes_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../..
./aes -i ../../data/aes/1KB.data -k ../../data/aes/key.data -q -v