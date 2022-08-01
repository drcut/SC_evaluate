CC = g++
NVCC = g++

DEFS += \
		-DGPU_TIMER \
		$(SPACE)

NVCCFLAGS += -I../common \
			 -O3 \
			 -lm \
			 -std=c++17 \
			 -I/nethome/rhan38/Intel_PPoPP_evaluate/SC_evaluate/HIP-CPU/include \
			 $(SPACE)

CFLAGS += -I../common \
		  -O3 \
		  -Wall \
		  -std=c++17 \
		  -I/nethome/rhan38/Intel_PPoPP_evaluate/SC_evaluate/HIP-CPU/include \
		  $(SPACE)

# Add source files here
EXECUTABLE  := lud_cuda
# Cuda source files (compiled with cudacc)
CUFILES     := lud_kernel.cc

OBJS = ../common/common.o lud.o lud_kernel.o

# 'make time=1' compiles for time measurement
ifeq ($(time),1)
	TIMER = -DTIME_IT
endif

.PHONY: all clean 
all : $(EXECUTABLE)

.c.o : 
	$(NVCC) $(KERNEL_DIM) $(NVCCFLAGS) $(TIMER) $(DEFS) -o $@ -c $<

%.o:	%.cc 
	$(NVCC) $(KERNEL_DIM) $(NVCCFLAGS) $(TIMER) $(DEFS) -o $@ -c $<


$(EXECUTABLE) : $(OBJS)
	$(NVCC) $(NVCCFLAGS) $(TIMER) -o $@ $?  -lpthread -ltbb -fpermissive

clean:
	rm -f $(EXECUTABLE) $(OBJS) *.linkinfo
