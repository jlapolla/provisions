define $(d)template
$(eval include download.mk)
$(eval include helpdoc.mk)

$(d)node-v4.2.1-x86.tar.gz:
	$(call download,https://nodejs.org/dist/v4.2.1/node-v4.2.1-linux-x86.tar.gz,$$@)

$(d)node-v4.2.1-x64.tar.gz:
	$(call download,https://nodejs.org/dist/v4.2.1/node-v4.2.1-linux-x64.tar.gz,$$@)

$(call helpdoc,$(d)node-x86.tar.gz)
$(d)node-x86.tar.gz: $(d)node-v4.2.1-x86.tar.gz
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)node-x64.tar.gz)
$(d)node-x64.tar.gz: $(d)node-v4.2.1-x64.tar.gz
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)node*

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
