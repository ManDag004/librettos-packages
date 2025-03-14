CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm
BUILD_DIR := $(shell pwd)/build

all: build/bw_mem

# Clone lmbench if not already present
lmbench:
	git clone https://github.com/intel/lmbench.git

# Create build directory
build:
	mkdir -p build

# Build bw_mem using the lmbench build system
build/bw_mem: lmbench build
	cd lmbench/src && \
	CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	O="$(BUILD_DIR)" \
	$(MAKE) $$(basename $@)
	# Ensure the binary exists
	test -f build/bw_mem || (echo "Failed to build bw_mem"; exit 1)
	# Print a message to help with debugging
	file build/bw_mem

clean:
	rm -rf build
	-cd lmbench/src && $(MAKE) clean

.PHONY: all clean