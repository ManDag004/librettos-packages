CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm

# Define lmbench source directory
LMBENCH_DIR := lmbench/src
LMBENCH_INCLUDES := -I$(LMBENCH_DIR)

# Object files needed for bw_mem
OBJS := build/bw_mem.o \
	build/lib_timing.o \
	build/lib_mem.o \
	build/lib_stats.o \
	build/lib_debug.o \
	build/getopt.o

all: build/bw_mem

# Clone lmbench if not already present
lmbench:
	git clone https://github.com/intel/lmbench.git

# Create build directory
build:
	mkdir -p build

# Compile bw_mem.c
build/bw_mem.o: lmbench $(LMBENCH_DIR)/bw_mem.c | build
	$(CC) $(CFLAGS) $(LMBENCH_INCLUDES) -c $(LMBENCH_DIR)/bw_mem.c -o $@

# Compile library files
build/lib_timing.o: lmbench $(LMBENCH_DIR)/lib_timing.c | build
	$(CC) $(CFLAGS) $(LMBENCH_INCLUDES) -c $(LMBENCH_DIR)/lib_timing.c -o $@

build/lib_mem.o: lmbench $(LMBENCH_DIR)/lib_mem.c | build
	$(CC) $(CFLAGS) $(LMBENCH_INCLUDES) -c $(LMBENCH_DIR)/lib_mem.c -o $@

build/lib_stats.o: lmbench $(LMBENCH_DIR)/lib_stats.c | build
	$(CC) $(CFLAGS) $(LMBENCH_INCLUDES) -c $(LMBENCH_DIR)/lib_stats.c -o $@

build/lib_debug.o: lmbench $(LMBENCH_DIR)/lib_debug.c | build
	$(CC) $(CFLAGS) $(LMBENCH_INCLUDES) -c $(LMBENCH_DIR)/lib_debug.c -o $@

build/getopt.o: lmbench $(LMBENCH_DIR)/getopt.c | build
	$(CC) $(CFLAGS) $(LMBENCH_INCLUDES) -c $(LMBENCH_DIR)/getopt.c -o $@

# Link all object files into bw_mem binary
build/bw_mem: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

clean:
	rm -rf build