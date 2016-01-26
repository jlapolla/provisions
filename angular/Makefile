# File download template
define $(d)template
$(eval include download.mk)
$(d)$(1)-$(3)$(2):
	$(call download,https://code.angularjs.org/$(3)/$(1)$(2),$(d)$(1)-$(3)$(2))
endef

$(eval $(call $(d)template,angular,.min.js,1.4.9))
$(eval $(call $(d)template,angular-animate,.min.js,1.4.9))
$(eval $(call $(d)template,angular-aria,.min.js,1.4.9))
$(eval $(call $(d)template,angular-cookies,.min.js,1.4.9))
$(eval $(call $(d)template,angular-csp,.css,1.4.9))
$(eval $(call $(d)template,angular-loader,.min.js,1.4.9))
$(eval $(call $(d)template,angular-message-format,.min.js,1.4.9))
$(eval $(call $(d)template,angular-messages,.min.js,1.4.9))
$(eval $(call $(d)template,angular-mocks,.js,1.4.9))
$(eval $(call $(d)template,angular-resource,.min.js,1.4.9))
$(eval $(call $(d)template,angular-route,.min.js,1.4.9))
$(eval $(call $(d)template,angular-sanitize,.min.js,1.4.9))
$(eval $(call $(d)template,angular-scenario,.js,1.4.9))
$(eval $(call $(d)template,angular-touch,.min.js,1.4.9))
$(eval $(d)template :=)

# Main template
define $(d)template

$(eval include helpdoc.mk)

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)angular*

$(eval .DEFAULT_GOAL := help)

endef

$(eval $($(d)template))
$(eval $(d)template :=)
