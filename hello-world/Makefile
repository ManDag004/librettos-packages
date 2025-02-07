# Minimal Makefile for hello-world

# Use the compiler from the toolchain provided in RUMPRUN_TOOLCHAIN_TUPLE;
# if not set, you might default to gcc.
CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2

all: build/hello-world

build/hello-world: hello-world.c
	@mkdir -p build
	$(CC) $(CFLAGS) -o build/hello-world hello-world.c

clean:
	rm -rf build
