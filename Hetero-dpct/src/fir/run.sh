dpct cuda/fir_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o fir cuda/main.cc dpct_output/fir_cuda_benchmark.dp.cpp \
    *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc \
     ../common/time_measurement/*.cc -I../.. -lpthread
./fir -q -v