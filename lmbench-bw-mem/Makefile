CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2
LDFLAGS := -lm

all: build/bw_mem

lmbench:
	git clone https://github.com/intel/lmbench.git

build/bw_mem: lmbench
	@mkdir -p build
	cd lmbench/src && $(MAKE) CC="$(CC)" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" OS="$(RUMPRUN_TOOLCHAIN_TUPLE)" bw_mem
	@mkdir -p build
	@find lmbench -name bw_mem -type f -exec cp {} build/ \; 2>/dev/null || true

clean:
	rm -rf lmbench build