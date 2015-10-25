# GMTK require directive
include require.mk

# Require submodules
$(call ,$(call require,$(addprefix $(d),$(addsuffix /Makefile,apache bootstrap cpanm jquery nodejs vnu))))

# Include libraries used in THIS Makefile
include helpdoc.mk

define $(d)template
$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean: $(addprefix $(d),$(addsuffix /clean,apache bootstrap cpanm jquery nodejs vnu))

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
