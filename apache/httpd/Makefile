# Include common Make functions.
include $(MK_COMMON)

# Private variables.
MIRROR := http://mirror.cogentco.com/pub/apache
APACHE := https://www.apache.org/dist

# Private targets.
KEY:
	$(error TODO: Figure out needed signing keys.)
	$(call GPG_RECV_KEY,$@,$@)

httpd-v2.4.16-UNVERIFIED.tar.gz:
	$(call DOWNLOAD,$(MIRROR)/httpd/httpd-2.4.16.tar.gz,$@)

httpd-v2.4.16.tar.gz.asc:
	$(call DOWNLOAD,$(APACHE)/httpd/httpd-2.4.16.tar.gz.asc,$@)

httpd-v2.4.16.tar.gz: httpd-v2.4.16.tar.gz.asc httpd-v2.4.16-UNVERIFIED.tar.gz | KEY
	gpg --verify $^
	cp $(lastword $^) $@

# Help text header.
HELP_TEXT = $(info Apache HTTP Server)

# Public targets.
HELP_TEXT += $(info [httpd-stable.tar.gz] Latest stable Apache HTTP server source distribution.)
httpd-stable.tar.gz: httpd-v2.4.16.tar.gz
	ln -s $< $@

.PHONY: clean help

# Delete build artifacts.
clean:
	rm -rf httpd* KEY

# Display help text.
help:
	$(HELP_TEXT)
	@true
