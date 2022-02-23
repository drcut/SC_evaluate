nvcc -std=c++11 -o kmeans cuda/main.cc cuda/kmeans_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./kmeans -i ../../data/kmeans/100_34.txt  -q -v

