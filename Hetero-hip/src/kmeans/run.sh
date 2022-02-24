hipify-clang cuda/kmeans_cuda_benchmark.cu --cuda-path=/usr/local/cuda \
    -I /usr/local/cuda/samples/common/inc \
    -I../.. -o cuda/kmeans_cuda_benchmark.cc
g++ -o kmeans cuda/*.cc *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread -ltbb -fpermissive
./kmeans -i ../../data/kmeans/100_34.txt  -q -v