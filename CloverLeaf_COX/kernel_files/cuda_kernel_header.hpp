#ifndef __CUDA_KERNEL_HEADER
#define __CUDA_KERNEL_HEADER
#include "../ftocmacros.h"

// size of workgroup/block - 256 seems to be optimal
#ifndef BLOCK_SZ
#define BLOCK_SZ 256
#endif

// number of bytes to allocate for x size array
#define BUFSZX(x_extra) \
    (((x_max) + 4 + x_extra) * sizeof(double))

// number of bytes to allocate for y size array
#define BUFSZY(y_extra) \
    (((y_max) + 4 + y_extra) * sizeof(double))

// number of bytes to allocate for 2d array
#define BUFSZ2D(x_extra, y_extra) \
    (((x_max) + 4 + x_extra) * ((y_max) + 4 + y_extra) * sizeof(double))

/*
 *  access a value in a 2d array given the x and y offset from current thread
 *  index, adding or subtracting a bit more if it is one of the arrays with
 *  bigger rows
 */
#define THARR2D(x_offset, y_offset, big_row) \
    (glob_id + (x_offset) + ((y_offset) * (x_max + 4)) + (big_row * (row + (y_offset))))

// kernel indexes uses in all kernels
#define __kernel_indexes                                       \
    const int glob_id = threadIdx.x + blockIdx.x * blockDim.x; \
    __attribute__((__unused__)) const int lid = threadIdx.x;   \
    const int row = glob_id / (x_max + 4);                     \
    const int column = glob_id % (x_max + 4);

template <typename T>
__device__ inline T SUM(T a, T b) { return a + b; }
template <typename T>
__device__ inline T MAXIMUM(T a, T b) { return a < b ? b : a; }
template <typename T>
__device__ inline T MINIMUM(T a, T b) { return a < b ? a : b; }

#endif //__CUDA_KERNEL_HEADER
