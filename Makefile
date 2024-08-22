# Project Name
PROJECT_NAME := zendm

# Compiler and Flags
CC := gcc
CFLAGS := -Wall -Wextra -pedantic -std=c99 -O2 -Iinclude

# ncurses library
LIBS := -lncurses -lform

# Directories
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
INCLUDE_DIR := include

# Source and Object Files
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

# Output Binary
OUTPUT := $(BIN_DIR)/$(PROJECT_NAME)

# Phony targets
.PHONY: all clean install uninstall dist distclean valgrind

# Default target
all: $(OUTPUT)

# Link the final executable
$(OUTPUT): $(OBJS) | $(BIN_DIR)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LIBS)
	@echo "Build successful!"

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Create bin and obj directories if they don't exist
$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

# Run binary
run: $(OUTPUT)
	./bin/zendm

# Run binary with Valgrind
valgrind: $(OUTPUT)
	valgrind --leak-check=full --show-leak-kinds=all ./bin/zendm

# Clean build artifacts
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Cleaned build artifacts."

# Install the binary to /usr/local/bin
install: $(OUTPUT)
	install -d /usr/local/bin
	install $(OUTPUT) /usr/local/bin/$(PROJECT_NAME)
	@echo "Installed $(PROJECT_NAME) to /usr/local/bin."

# Uninstall the binary
uninstall:
	rm -f /usr/local/bin/$(PROJECT_NAME)
	@echo "Uninstalled $(PROJECT_NAME)."

# Create a source distribution
dist: clean
	tar -cvzf $(PROJECT_NAME).tar.gz $(SRC_DIR) $(INCLUDE_DIR) Makefile README.md
	@echo "Created source distribution $(PROJECT_NAME).tar.gz."

# Clean everything, including generated files and directories
distclean: clean
	rm -f $(PROJECT_NAME).tar.gz
	@echo "Cleaned all generated files."

# Include dependency files
-include $(OBJS:.o=.d)

# Generate dependency files
$(OBJ_DIR)/%.d: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -MM -MT $(@:.d=.o) $< > $@
