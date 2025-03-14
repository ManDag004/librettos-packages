CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm

all: build/bw_mem

# Create build directory
build:
	mkdir -p build

# Clone lmbench if not already present
lmbench:
	git clone https://github.com/intel/lmbench.git

# Build bw_mem as a single target with dependencies
build/bw_mem: lmbench | build
	$(CC) $(CFLAGS) -Ilmbench/src \
		-o build/bw_mem \
		lmbench/src/bw_mem.c \
		lmbench/src/lib_timing.c \
		lmbench/src/lib_mem.c \
		lmbench/src/lib_stats.c \
		lmbench/src/lib_debug.c \
		lmbench/src/getopt.c \
		$(LDFLAGS)

clean:
	rm -rf build