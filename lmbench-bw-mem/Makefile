CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm

all: build/bw_mem

# Clone lmbench if not already present
lmbench:
	git clone https://github.com/intel/lmbench.git

# Build bw_mem directly from its source files
build/bw_mem: lmbench
	@mkdir -p build
	# Create lmbench bin directory
	mkdir -p lmbench/bin/$(RUMPRUN_TOOLCHAIN_TUPLE)
	# First compile lib_timing.c
	cd lmbench/src && $(CC) $(CFLAGS) -c lib_timing.c -o lib_timing.o
	# Next compile lib_mem.c
	cd lmbench/src && $(CC) $(CFLAGS) -c lib_mem.c -o lib_mem.o
	# Next compile lib_stats.c
	cd lmbench/src && $(CC) $(CFLAGS) -c lib_stats.c -o lib_stats.o
	# Next compile getopt.c
	cd lmbench/src && $(CC) $(CFLAGS) -c getopt.c -o getopt.o
	# Compile bw_mem.c
	cd lmbench/src && $(CC) $(CFLAGS) -c bw_mem.c -o bw_mem.o
	# Link everything together
	cd lmbench/src && $(CC) -o ../bin/$(RUMPRUN_TOOLCHAIN_TUPLE)/bw_mem bw_mem.o lib_timing.o lib_mem.o lib_stats.o getopt.o $(LDFLAGS)
	# Copy the binary to our build directory
	cp lmbench/bin/$(RUMPRUN_TOOLCHAIN_TUPLE)/bw_mem build/

clean:
	rm -rf build