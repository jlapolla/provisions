# GMTK require directive
include require.mk

# Require submodules
$(call ,$(call require,$(d)apr/Makefile))

# Include libraries used in THIS Makefile
include recv_key.mk
include helpdoc.mk
include verify_sig.mk
include download.mk

# Control compilation with a template
define $(d)template
# Variabes
$(eval $(d)mirror := http://mirror.cogentco.com/pub/apache/)
$(eval $(d)apache := https://www.apache.org/dist/)

# Specific rules
$(d)791485A8:
	$$(call recv_key,$$(notdir $$@),$$@)

$(d)httpd-v2.4.16-UNVERIFIED.tar.gz:
	$$(call download,$($(d)mirror)httpd/httpd-2.4.16.tar.gz,$$@)

$(d)httpd-v2.4.16.tar.gz.asc:
	$$(call download,$($(d)apache)httpd/httpd-2.4.16.tar.gz.asc,$$@)

$(d)httpd-v2.4.16.tar.gz: $(d)httpd-v2.4.16.tar.gz.asc $(d)httpd-v2.4.16-UNVERIFIED.tar.gz | $(d)791485A8
	$$(call verify_sig,$$(firstword $$^),$$(lastword $$^))
	cp $$(lastword $$^) $$@

# Summary rules
$(call helpdoc,$(d)httpd.tar.gz)
$(d)httpd.tar.gz: $(d)httpd-v2.4.16.tar.gz
	ln -sf $$(notdir $$<) $$@

.PHONY: $(d)clean
$(call helpdoc,$(d)clean)
$(d)clean: $(d)apr/clean
	rm -rf $(d)httpd* $(d)791485A8

$(eval .DEFAULT_GOAL := help)
endef

# Compile template
$(eval $($(d)template))

# Free memory
$(eval $(d)template :=)
$(eval $(d)mirror :=)
$(eval $(d)apache :=)
