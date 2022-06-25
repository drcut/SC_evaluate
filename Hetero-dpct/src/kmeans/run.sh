# dpct cuda/kmeans_cuda_benchmark.cu --extra-arg="-I../.."
dpcpp -o kmeans cuda/main.cc dpct_output/kmeans_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
time ./kmeans -i ../../data/kmeans/100000_34.txt -q

