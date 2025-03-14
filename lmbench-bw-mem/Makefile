CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm
AR := ar
ARCREATE := cr

all: build/bw_mem

# Build bw_mem
build/bw_mem: 
	@mkdir -p build
	
	# Compile necessary object files
	$(CC) $(CFLAGS) -c lmbench/src/lib_timing.c -o build/lib_timing.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/lib_mem.c -o build/lib_mem.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/lib_tcp.c -o build/lib_tcp.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/lib_udp.c -o build/lib_udp.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/lib_unix.c -o build/lib_unix.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/lib_debug.c -o build/lib_debug.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/lib_stats.c -o build/lib_stats.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/lib_sched.c -o build/lib_sched.o -I./lmbench/src
	$(CC) $(CFLAGS) -c lmbench/src/getopt.c -o build/getopt.o -I./lmbench/src
	
	# Create library
	$(AR) $(ARCREATE) build/lmbench.a build/lib_timing.o build/lib_mem.o build/lib_tcp.o \
	build/lib_udp.o build/lib_unix.o build/lib_debug.o build/lib_stats.o \
	build/getopt.o build/lib_sched.o
	
	# Compile bw_mem
	$(CC) $(CFLAGS) -o build/bw_mem lmbench/src/bw_mem.c build/lmbench.a $(LDFLAGS) -I./lmbench/src
	
	@echo "bw_mem successfully built for rump kernel."

clean:
	rm -rf build