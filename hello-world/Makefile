# Compiler
CC = gcc

# Build directory
BUILD_DIR = build

# Output binary
TARGET = $(BUILD_DIR)/hello-world

# Source files
SRC = main.c

# Compiler flags
CFLAGS = -Wall -Wextra -std=c11

# Default rule
all: $(TARGET)

# Create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile main.c and store binary in build directory
$(TARGET): $(BUILD_DIR) $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Clean up generated files
clean:
	rm -rf $(BUILD_DIR)
