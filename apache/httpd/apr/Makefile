define $(d)template
$(eval include download.mk)
$(eval include helpdoc.mk)
$(eval include recv_key.mk)
$(eval include verify_sig.mk)

$(eval $(d)mirror := http://mirror.cogentco.com/pub/apache/)
$(eval $(d)apache := https://www.apache.org/dist/)

$(d)39FF092C:
	$(call recv_key,$$(notdir $$@),$$@)

$(d)apr-v1.5.2-UNVERIFIED.tar.gz:
	$(call download,$($(d)mirror)apr/apr-1.5.2.tar.gz,$$@)

$(d)apr-v1.5.2.tar.gz.asc:
	$(call download,$($(d)apache)apr/apr-1.5.2.tar.gz.asc,$$@)

$(d)apr-v1.5.2.tar.gz: $(d)apr-v1.5.2.tar.gz.asc $(d)apr-v1.5.2-UNVERIFIED.tar.gz | $(d)39FF092C
	$(call verify_sig,$$(firstword $$^),$$(lastword $$^))
	cp $$(lastword $$^) $$@

$(d)apr-util-v1.5.4-UNVERIFIED.tar.gz:
	$(call download,$($(d)mirror)apr/apr-util-1.5.4.tar.gz,$$@)

$(d)apr-util-v1.5.4.tar.gz.asc:
	$(call download,$($(d)apache)apr/apr-util-1.5.4.tar.gz.asc,$$@)

$(d)apr-util-v1.5.4.tar.gz: $(d)apr-util-v1.5.4.tar.gz.asc $(d)apr-util-v1.5.4-UNVERIFIED.tar.gz | $(d)39FF092C
	$(call verify_sig,$$(firstword $$^),$$(lastword $$^))
	cp $$(lastword $$^) $$@

$(call helpdoc,$(d)apr.tar.gz)
$(d)apr.tar.gz: $(d)apr-v1.5.2.tar.gz
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)apr-util.tar.gz)
$(d)apr-util.tar.gz: $(d)apr-util-v1.5.4.tar.gz
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)apr* $(d)39FF092C

$(eval .DEFAULT_GOAL := help)

$(eval $(d)mirror :=)
$(eval $(d)apache :=)
endef

$(eval $($(d)template))
$(eval $(d)temlpate :=)
