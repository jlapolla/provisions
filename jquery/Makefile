define $(d)template
$(eval include download.mk)
$(eval include helpdoc.mk)

$(d)jquery-1.11.3.min.js:
	$(call download,https://code.jquery.com/jquery-1.11.3.min.js,$$@)

$(d)jquery-2.1.4.min.js:
	$(call download,https://code.jquery.com/jquery-2.1.4.min.js,$$@)

$(call helpdoc,$(d)jquery.min.js,Latest stable jQuery)
$(d)jquery.min.js: $(d)jquery-2.1.4.min.js
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)jquery-v1.min.js,Latest stable jQuery (major version 1 compatible))
$(d)jquery-v1.min.js: $(d)jquery-1.11.3.min.js
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)jquery-v2.min.js,Latest stable jQuery (major version 2 compatible))
$(d)jquery-v2.min.js: $(d)jquery-2.1.4.min.js
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)jquery*

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
