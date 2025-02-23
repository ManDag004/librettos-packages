CC := $(RUMPRUN_TOOLCHAIN_TUPLE)-gcc
CFLAGS := -O2

all: build/hello-world

build/hello-world: hello-world.c
	@mkdir -p build
	$(CC) $(CFLAGS) -o build/hello-world hello-world.c

clean:
	rm -rf build
