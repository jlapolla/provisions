define $(d)template
$(eval include download.mk)
$(eval include helpdoc.mk)

$(d)bootstrap-v3.3.5.min.css:
	$(call download,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css,$$@)

$(d)bootstrap-v3.3.5.min.js:
	$(call download,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js,$$@)

$(d)bootstrap-theme-v3.3.5.min.css:
	$(call download,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css,$$@)

$(call helpdoc,$(d)bootstrap.min.css,Latest stable Bootstrap CSS)
$(d)bootstrap.min.css: $(d)bootstrap-v3.3.5.min.css
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)bootstrap.min.js,Latest stable Bootstrap JS)
$(d)bootstrap.min.js: $(d)bootstrap-v3.3.5.min.js
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)bootstrap-theme.min.css,Latest stable Bootstrap theme CSS)
$(d)bootstrap-theme.min.css: $(d)bootstrap-theme-v3.3.5.min.css
	ln -sf $$(notdir $$<) $$@

$(call helpdoc,$(d)clean)
.PHONY: $(d)clean
$(d)clean:
	rm -f $(d)bootstrap*

$(eval .DEFAULT_GOAL := help)
endef

$(eval $($(d)template))
$(eval $(d)template :=)
