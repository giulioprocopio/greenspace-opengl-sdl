CMAKE = cmake
BUILD_DIR = build

# Generate the Makefile using CMake.
$(BUILD_DIR)/Makefile:
	mkdir -p $(BUILD_DIR)
	$(CMAKE) -S . -B $(BUILD_DIR)

# Build the project.
build: $(BUILD_DIR)/Makefile
	$(MAKE) -C $(BUILD_DIR)

# Clean the build directory.
clean:
	$(MAKE) -C $(BUILD_DIR) clean
	rm -rf $(BUILD_DIR)

.PHONY: build clean