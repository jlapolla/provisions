# File download template
define $(d)template
$(eval include download.mk)
$(d)$(1)-$(3)$(2):
	$(call download,https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/$(3)/$(1)$(2),$(d)$(1)-$(3)$(2))
endef
$(eval $(call $(d)template,angular-ui-router,.min.js,0.2.17))
$(eval $(d)template :=)

# Main template
define $(d)template

$(eval include helpdoc.mk)

.PHONY: $(d)clean
$(call helpdoc,$(d)clean)
$(d)clean:
	rm -f $(d)angular*

$(eval .DEFAULT_GOAL := help)
endef

$(eval $(call $(d)template))
$(eval $(d)template :=)

