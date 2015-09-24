# GMTK require directive
include require.mk

# Require submodules
$(call ,$(call require,$(d)apache/Makefile))

# Include libraries used in THIS Makefile
include helpdoc.mk

# Control compilation with a template
define $(d)template
# Summary rules
.PHONY: $(d)clean
$(call helpdoc,$(d)clean)
$(d)clean: $(d)apache/clean

$(eval .DEFAULT_GOAL := help)
endef

# Compile template
$(eval $($(d)template))

# Free memory
$(eval $(d)template :=)
