include require.mk

$(call ,$(call require,$(d)apr/Makefile))

define $(d)template
$(eval include download.mk)
$(eval include helpdoc.mk)
$(eval include recv_key.mk)
$(eval include verify_sig.mk)

$(eval $(d)mirror := http://mirror.cogentco.com/pub/apache/)
$(eval $(d)apache := https://www.apache.org/dist/)
$(eval $(d)version := 2.4.17)

$(d)791485A8:
	$(call recv_key,$$(notdir $$@),$$@)

$(d)httpd-v$($(d)version)-UNVERIFIED.tar.gz:
	$(call download,$($(d)mirror)httpd/httpd-$($(d)version).tar.gz,$$@)

$(d)httpd-v$($(d)version).tar.gz.asc:
	$(call download,$($(d)apache)httpd/httpd-$($(d)version).tar.gz.asc,$$@)

$(d)httpd-v$($(d)version).tar.gz: $(d)httpd-v$($(d)version).tar.gz.asc $(d)httpd-v$($(d)version)-UNVERIFIED.tar.gz | $(d)791485A8
	$(call verify_sig,$$(firstword $$^),$$(lastword $$^))
	cp $$(lastword $$^) $$@

$(call helpdoc,$(d)httpd.tar.gz)
$(d)httpd.tar.gz: $(d)httpd-v$($(d)version).tar.gz
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean: $(d)apr/clean
	rm -rf $(d)build* $(d)httpd* $(d)791485A8

$(eval .DEFAULT_GOAL := help)

$(eval $(d)mirror :=)
$(eval $(d)apache :=)
$(eval $(d)version :=)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
