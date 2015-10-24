# GMTK require directive
include require.mk

# Require submodules
$(call ,$(call require,$(addprefix $(d),$(addsuffix /Makefile,apache bootstrap cpanm jquery vnu))))

# Include libraries used in THIS Makefile
include helpdoc.mk

# Control compilation with a template
define $(d)template
.PHONY: $(d)clean
$(call helpdoc,$(d)clean)
$(d)clean: $(addprefix $(d),$(addsuffix /clean,apache bootstrap cpanm jquery vnu))

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
