include Makefile.inc

# Our top-level target: we want to end up with build/hello
all: build/hello

# The final binary we want: build/hello
build/hello: build/Makefile
	$(MAKE) -C build -f ../Hello.make

# We pretend to have a configure script in build/configure.
# In a real project, you'd run something like "./configure" here.
build/Makefile: build/configure
	@echo "Creating Makefile inside build directory..."
	@touch $@

# "configure" step: we create the build directory, copy or create what's needed.
build/configure:
	@mkdir -p build
	@echo "echo 'Simulated configure script...'" > build/configure
	@chmod +x build/configure
	@touch $@

# Optional: a patch step, as in your original snippet (unused here).
# If you had patches, you'd apply them before configuring.
build/stamp_patch:
	@echo "(No patches to apply here.)"
	@touch $@

# Clean up generated files
.PHONY: clean distclean
clean:
	@rm -rf build

distclean: clean
	@echo "Nothing else to distclean."
