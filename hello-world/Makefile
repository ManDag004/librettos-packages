# Include shared definitions for rumprun toolchain variables.
# This file should define, for example, RUMPRUN_CC and RUMPRUN_TOOLCHAIN_TUPLE.
include ../Makefile.inc

# Compiler flags for our hello world application
CFLAGS += -Wall -Wextra -std=c11

# Name of the intermediate and final binaries
HELLO_BIN = build/hello-world
BAKED_BIN = build/hello-world.bin

# Default target: build the baked (unikernel) binary.
all: $(BAKED_BIN)

# Create the build directory if it doesn't exist.
build:
	mkdir -p build

# Build the hello world application using the rumprun toolchain.
# Note: $(RUMPRUN_CC) should be set (e.g., to x86_64-rumprun-netbsd-gcc)
$(HELLO_BIN): hello.c | build
	$(RUMPRUN_CC) $(CFLAGS) hello.c -o $(HELLO_BIN)

# “Bake” the binary to produce a rumprun unikernel binary.
# The rumprun-bake tool extracts the special tuple from the binary;
# if the binary isn’t built as a proper rumprun application, you’ll see an error.
$(BAKED_BIN): $(HELLO_BIN)
	rumprun-bake nrk_generic $(HELLO_BIN) $(BAKED_BIN)

# Clean up generated files.
clean:
	rm -rf build
