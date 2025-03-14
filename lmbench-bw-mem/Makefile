CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm

all: build/bw_mem

# Clone lmbench if not already present
lmbench:
	git clone https://github.com/intel/lmbench.git

# Build bw_mem using the existing lmbench build system
build/bw_mem: lmbench
	@mkdir -p build
	# Build the lmbench library first
	cd lmbench/src && $(MAKE) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" OS="$(RUMPRUN_TOOLCHAIN_TUPLE)" $O=../bin/$(RUMPRUN_TOOLCHAIN_TUPLE) lmbench.a
	# Then build bw_mem which depends on the library
	cd lmbench/src && $(MAKE) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" OS="$(RUMPRUN_TOOLCHAIN_TUPLE)" $O=../bin/$(RUMPRUN_TOOLCHAIN_TUPLE) bw_mem
	# Copy the binary to our build directory
	cp lmbench/bin/$(RUMPRUN_TOOLCHAIN_TUPLE)/bw_mem build/

clean:
	rm -rf build