# Include common Make functions.
include $(MK_COMMON)

# Private variables.
MIRROR := http://mirror.cogentco.com/pub/apache
APACHE := https://www.apache.org/dist

# Private targets.
KEY:
	$(call GPG_RECV_KEY,$@,$@)

apr-v1.5.2-UNVERIFIED.tar.gz:
	$(call DOWNLOAD,$(MIRROR)/apr/apr-1.5.2.tar.gz,$@)

apr-v1.5.2.tar.gz.asc:
	$(call DOWNLOAD,$(APACHE)/apr/apr-1.5.2.tar.gz.asc,$@)

apr-v1.5.2.tar.gz: apr-v1.5.2.tar.gz.asc apr-v1.5.2-UNVERIFIED.tar.gz | KEY
	gpg --verify $^
	cp $(lastword $^) $@

apr-util-v1.5.4-UNVERIFIED.tar.gz:
	$(call DOWNLOAD,$(MIRROR)/apr/apr-util-v1.5.4.tar.gz,$@)

apr-util-v1.5.4.tar.gz.asc:
	$(call DOWNLOAD,$(APACHE)/apr/apr-util-v1.5.4.tar.gz.asc,$@)

apr-util-v1.5.4.tar.gz: apr-util-v1.5.4.tar.gz.asc apr-util-v1.5.4-UNVERIFIED.tar.gz | KEY
	gpg --verify $^
	cp $(lastword $^) $@

# Help text header.
HELP_TEXT = $(info Apache Portable Rutime)

# Public targets.
HELP_TEXT += $(info [apr.tar.gz] Latest stable APR.)
apr.tar.gz: apr-v1.5.2.tar.gz
	ln -s $< $@

HELP_TEXT += $(info [apr-util.tar.gz] Latest stable APR utilities.)
apr-util.tar.gz: apr-util-v1.5.4.tar.gz
	ln -s $< $@

.PHONY: clean help

# Delete build artifacts.
clean:
	rm -rf apr* KEY

# Display help text.
help:
	$(HELP_TEXT)
	@true
