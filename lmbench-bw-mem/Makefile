CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm

all: build/bw_mem

build/bw_mem:
	@mkdir -p build
	# Override variables and build just bw_mem
	cd lmbench && $(MAKE) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" OS="$(RUMPRUN_TOOLCHAIN_TUPLE)" build
	# The binary will be in lmbench/bin/$(OS)/bw_mem
	# Copy it to where our build system expects it
	@mkdir -p build
	@cp lmbench/bin/$(RUMPRUN_TOOLCHAIN_TUPLE)/bw_mem build/ 2>/dev/null || true

clean:
	cd lmbench && $(MAKE) clean
	rm -rf build