nvcc -std=c++11 -o knn cuda/main.cc cuda/knn_cuda_benchmark.cu *.cc \
 ../common/benchmark/*.cc ../common/command_line_option/*.cc \
 ../common/time_measurement/*.cc -I../.. -lpthread
./knn -i knnhelp.data -v -q

