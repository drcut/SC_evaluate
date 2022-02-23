dpct cuda/knn_cuda_benchmark.cu cuda/knn_gpu_partitioner.h cuda/knn_cuda_benchmark.h --extra-arg="-I../.."
dpcpp -o knn cuda/main.cc dpct_output/knn_cuda_benchmark.dp.cpp *.cc ../common/benchmark/*.cc ../common/command_line_option/*.cc ../common/time_measurement/*.cc -I../.. -lpthread
./knn -i knnhelp.data -v -q


