# Include libraries used in THIS Makefile
include recv_key.mk
include helpdoc.mk
include verify_sig.mk
include download.mk

# Control compilation with a template
define $(d)template
# Variables
$(eval $(d)mirror := http://mirror.cogentco.com/pub/apache/)
$(eval $(d)apache := https://www.apache.org/dist/)

# Specific rules
$(d)39FF092C:
	$$(call recv_key,$$(notdir $$@),$$@)

$(d)apr-v1.5.2-UNVERIFIED.tar.gz:
	$$(call download,$($(d)mirror)apr/apr-1.5.2.tar.gz,$$@)

$(d)apr-v1.5.2.tar.gz.asc:
	$$(call download,$($(d)apache)apr/apr-1.5.2.tar.gz.asc,$$@)

$(d)apr-v1.5.2.tar.gz: $(d)apr-v1.5.2.tar.gz.asc $(d)apr-v1.5.2-UNVERIFIED.tar.gz | $(d)39FF092C
	$$(call verify_sig,$$(firstword $$^),$$(lastword $$^))
	cp $$(lastword $$^) $$@

$(d)apr-util-v1.5.4-UNVERIFIED.tar.gz:
	$$(call download,$($(d)mirror)apr/apr-util-1.5.4.tar.gz,$$@)

$(d)apr-util-v1.5.4.tar.gz.asc:
	$$(call download,$($(d)apache)apr/apr-util-1.5.4.tar.gz.asc,$$@)

$(d)apr-util-v1.5.4.tar.gz: $(d)apr-util-v1.5.4.tar.gz.asc $(d)apr-util-v1.5.4-UNVERIFIED.tar.gz | $(d)39FF092C
	$$(call verify_sig,$$(firstword $$^),$$(lastword $$^))
	cp $$(lastword $$^) $$@

# Summary rules
$(call helpdoc,$(d)apr.tar.gz)
$(d)apr.tar.gz: $(d)apr-v1.5.2.tar.gz
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)apr-util.tar.gz)
$(d)apr-util.tar.gz: $(d)apr-util-v1.5.4.tar.gz
	ln -sf $$(notdir $$<) $$@

.PHONY: $(d)clean
$(call helpdoc,$(d)clean)
$(d)clean:
	rm -rf $(d)apr* $(d)39FF092C

$(eval .DEFAULT_GOAL := help)
endef

# Compile template
$(eval $($(d)template))

# Free memory
$(eval $(d)temlpate :=)
$(eval $(d)mirror :=)
$(eval $(d)apache :=)
