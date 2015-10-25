include require.mk

$(call ,$(call require,$(d)httpd/Makefile))

define $(d)template
$(eval include helpdoc.mk)

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean: $(d)httpd/clean

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
