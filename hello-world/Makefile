# Include global settings
include ../Makefile.inc

# Application Name
APP_NAME := hello-world

# Source File
SRC_FILE := $(APP_NAME).c

# Compiled ELF Binary
BIN_FILE := $(APP_NAME)

# Final Rumprun Unikernel Binary
RUMPRUN_BIN := build/$(APP_NAME).bin

# Compiler
CC := $(RUMPRUN_CC)

# C Flags
CFLAGS := -Wall -Werror -O2

# Rumprun Bake Target
BAKE_TARGET := hw_generic

# Build directory
BUILD_DIR := build

# Libraries (Dependencies)
LIBEVENT := $(RUMPRUN_PKGS_DIR)/lib/libevent.a
LIBGOMP  := $(RUMPRUN_PKGS_DIR)/lib/libgomp.a

# Default Target (compile unikernel + dependencies)
all: $(LIBEVENT) $(LIBGOMP) $(RUMPRUN_BIN)

# Ensure parallel building does not cause issues
.NOTPARALLEL: $(LIBEVENT) $(LIBGOMP)

# Build libevent
$(LIBEVENT):
	@echo "Building libevent..."
	$(MAKE) -C ../libevent

# Build libgomp (OpenMP)
$(LIBGOMP):
	@echo "Building libgomp..."
	$(MAKE) -C ../openmp

# Compile the application into an ELF binary
$(BIN_FILE): $(SRC_FILE)
	@echo "Compiling $(SRC_FILE) into $(BIN_FILE)..."
	$(CC) $(CFLAGS) -o $(BIN_FILE) $<

# Ensure build directory exists
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

# Bake the ELF binary into a Rumprun unikernel binary
$(RUMPRUN_BIN): $(BIN_FILE) | $(BUILD_DIR)
	@echo "Baking Rumprun unikernel binary..."
	rumprun-bake $(BAKE_TARGET) $(RUMPRUN_BIN) $(BIN_FILE)

# Validate the baked binary
check: $(RUMPRUN_BIN)
	@echo "Checking if $(RUMPRUN_BIN) is a valid Rumprun unikernel..."
	@rumprun-bake list $(RUMPRUN_BIN) || (echo "Error: Not a valid Rumprun unikernel binary!" && exit 1)

# Clean up compiled files
.PHONY: clean
clean:
	@echo "Cleaning up compiled files..."
	rm -f $(BIN_FILE) $(RUMPRUN_BIN)
	rm -rf $(BUILD_DIR)

# Deep clean (removes everything)
.PHONY: distclean
distclean: clean
	@echo "Removing build directory..."
	rm -rf build
