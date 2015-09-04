# Include common Make functions.
include $(MK_COMMON)

# Private targets.
jquery-1.11.3.min.js:
	$(call DOWNLOAD,https://code.jquery.com/jquery-1.11.3.min.js,$@)

jquery-2.1.4.min.js:
	$(call DOWNLOAD,https://code.jquery.com/jquery-2.1.4.min.js,$@)

# Help text header.
HELP_TEXT = $(info jQuery (https://jquery.com/))

# Public targets.
HELP_TEXT += $(info [jquery-stable.min.js] Latest stable jQuery, minified.)
jquery-stable.min.js: jquery-2.1.4.min.js
	ln -s $< $@

HELP_TEXT += $(info [jquery-stable-v1.min.js] Latest stable jQuery version 1, minified.)
jquery-stable-v1.min.js: jquery-1.11.3.min.js
	ln -s $< $@

HELP_TEXT += $(info [jquery-stable-v2.min.js] Latest stable jQuery version 2, minified.)
jquery-stable-v2.min.js: jquery-2.1.4.min.js
	ln -s $< $@

.PHONY: clean help

# Delete build artifacts.
clean:
	rm -rf jquery*

# Display help text.
help:
	$(HELP_TEXT)
	@true
