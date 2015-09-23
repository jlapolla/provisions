# GMTK require directive
include require.mk

# Require Makefiles
$(call ,$(call require,$(d)apache/apr/Makefile))
