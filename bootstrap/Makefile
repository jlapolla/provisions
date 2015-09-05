# Include common Make functions.
include $(MK_COMMON)

# Private targets.
bootstrap-v3.3.5.min.css:
	$(call DOWNLOAD,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css,$@)

bootstrap-theme-v3.3.5.min.css:
	$(call DOWNLOAD,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css,$@)

bootstrap-v3.3.5.min.js:
	$(call DOWNLOAD,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js,$@)

# Help text header.
HELP_TEXT = $(info Bootstrap)
HELP_TEXT += $(info URL: https://getbootstrap.com/)

# Public targets.
HELP_TEXT += $(info [bootstrap-stable.min.css] Latest stable Bootstrap CSS, minified.)
bootstrap-stable.min.css: bootstrap-v3.3.5.min.css
	ln -s $< $@

HELP_TEXT += $(info [bootstrap-stable.min.js] Latest stable Bootstrap JS, minified.)
bootstrap-stable.min.js: bootstrap-v3.3.5.min.js
	ln -s $< $@

HELP_TEXT += $(info [bootstrap-theme-stable.min.js] Latest stable Bootstrap theme CSS, minified.)
bootstrap-theme-stable.min.js: bootstrap-theme-v3.3.5.min.js
	ln -s $< $@

.PHONY: clean help

# Delete build artifacts.
clean:
	rm -rf bootstrap*

# Display help text.
help:
	$(HELP_TEXT)
	@true
