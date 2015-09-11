# Include common Make functions.
include $(MK_COMMON)

# Private targets.
bootstrap-v3.3.5.min.css:
	$(call DOWNLOAD,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css,$@)

bootstrap-v3.3.5.min.js:
	$(call DOWNLOAD,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js,$@)

bootstrap-theme-v3.3.5.min.css:
	$(call DOWNLOAD,https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css,$@)

# Help text header.
HELP_TEXT = $(info Bootstrap)
HELP_TEXT += $(info URL: https://getbootstrap.com/)

# Public targets.
HELP_TEXT += $(info [bootstrap.min.css] Latest stable Bootstrap CSS, minified.)
bootstrap.min.css: bootstrap-v3.3.5.min.css
	ln -sf $< $@

HELP_TEXT += $(info [bootstrap.min.js] Latest stable Bootstrap JS, minified.)
bootstrap.min.js: bootstrap-v3.3.5.min.js
	ln -sf $< $@

HELP_TEXT += $(info [bootstrap-theme.min.css] Latest stable Bootstrap theme CSS, minified.)
bootstrap-theme.min.css: bootstrap-theme-v3.3.5.min.css
	ln -sf $< $@

.PHONY: clean help

# Delete build artifacts.
clean:
	rm -rf bootstrap*

# Display help text.
help:
	$(HELP_TEXT)
	@true

# Run test script.
test:
	./test.sh

# Display help by default.
.DEFAULT_GOAL := help
