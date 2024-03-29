CC = gcc
NVCC = nvcc

DEFS += \
		-DGPU_TIMER \
		$(SPACE)

NVCCFLAGS += -I../common \
			 -O3 \
			 -use_fast_math \
			 -lm \
			 $(SPACE)

CFLAGS += -I../common \
					-I/usr/include/cuda \
		  -O3 \
		  -Wall \
		  $(SPACE)

# Add source files here
EXECUTABLE  := lud_cuda
# Cuda source files (compiled with cudacc)
CUFILES     := lud_kernel.cu
# C/C++ source files (compiled with gcc / c++)
CCFILES     := lud.c lud_cuda.c ../common/common.c

OBJS = ../common/common.o lud.o lud_kernel.o

# 'make time=1' compiles for time measurement
ifeq ($(time),1)
	TIMER = -DTIME_IT
endif

.PHONY: all clean 
all : $(EXECUTABLE)

.c.o : 
	$(NVCC) $(KERNEL_DIM) $(NVCCFLAGS) $(TIMER) $(DEFS) -o $@ -c $<

%.o:	%.cu 
	$(NVCC) $(KERNEL_DIM) $(NVCCFLAGS) $(TIMER) $(DEFS) -o $@ -c $<


$(EXECUTABLE) : $(OBJS)
	$(NVCC) $(NVCCFLAGS) $(TIMER) -o $@  $?

clean:
	rm -f $(EXECUTABLE) $(OBJS) *.linkinfo
