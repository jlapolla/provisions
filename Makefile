# List submodules
$(eval $(d)submodules := $(addsuffix /,$(filter-out extensions .git test,$(patsubst $(if $(d),$(d),./)%,%,$(shell find $(d) -mindepth 1 -maxdepth 1 -type d)))))

# Require submodules
include require.mk
$(eval $(d)subexports := $(call require,$(addprefix $(d),$(addsuffix Makefile,$(call $(d)submodules)))))

include helpdoc.mk

# Main template
define $(d)template

.PHONY: $(d)clean
$(call helpdoc,$(d)clean)
$(d)clean: $(addprefix $(d),$(addsuffix clean,$(call $(d)submodules)))

$(eval .DEFAULT_GOAL := help)
endef
$(eval $(call $(d)template))
$(eval $(d)template :=)

# Clear local variables
$(eval $(d)submodules :=)
$(eval $(d)subexports :=)
