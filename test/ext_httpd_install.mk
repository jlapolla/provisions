# GMTK require directive
include require.mk

# Require Makefiles
$(call ,$(call require,$(d)apache/httpd/Makefile))

# Require extensions
$(call ,$(call require,$(d)extensions/httpd_install.mk))

# Configure extensions
$(call ,$(call ext_httpd_install))# Unused configuration
$(call ,$(call ext_httpd_install,$(shell pwd)/tmp/,2.4.16))
$(call ,$(call ext_httpd_install,$(shell pwd)/TMP/,2.4.16))# Unused configuration

# Include libraries used in THIS Makefile
include hash4.mk

# Output build directory hash for use in test script
# NOTE: Provided prefix must be an absolute path
.PHONY: hash
hash:
	$(info $(call hash4,$(shell pwd)/tmp/2.4.16))
	@true
