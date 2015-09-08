# Include common Make functions.
include $(MK_COMMON)

# Recurse into subdirectories.
$(eval $(call RECURSE,..))

# Private variables.
MIRROR := http://mirror.cogentco.com/pub/apache
APACHE := https://www.apache.org/dist

# Private targets.
KEY:
	$(call GPG_RECV_KEY,$@,$@)

httpd-v2.4.16-UNVERIFIED.tar.gz:
	$(call DOWNLOAD,$(MIRROR)/httpd/httpd-2.4.16.tar.gz,$@)

httpd-v2.4.16.tar.gz.asc:
	$(call DOWNLOAD,$(APACHE)/httpd/httpd-2.4.16.tar.gz.asc,$@)

httpd-v2.4.16.tar.gz: httpd-v2.4.16.tar.gz.asc httpd-v2.4.16-UNVERIFIED.tar.gz | KEY
	gpg --verify $^
	cp $(lastword $^) $@

httpd/README: httpd-v2.4.16.tar.gz ../apr/apr-v1.5.2.tar.gz ../apr/apr-util-v1.5.4.tar.gz
	rm -rf httpd
	tar --no-same-owner -xzmf httpd-v2.4.16.tar.gz
	tar --no-same-owner -xzmf ../apr/apr-v1.5.2.tar.gz
	tar --no-same-owner -xzmf ../apr/apr-util-v1.5.4.tar.gz
	mv httpd-2.4.16 httpd
	mv apr-1.5.2 httpd/srclib/apr
	mv apr-util-v1.5.4 httpd/srclib/apr-util

ifeq ($(CURRENT_GOAL),install-home)
httpd/Makefile: httpd/README
	cd httpd && ./configure --with-included-apr --prefix="$(HOME)/usr/local"
else
httpd/Makefile: httpd/README
	cd httpd && ./configure --with-included-apr
endif

httpd/httpd: httpd/Makefile
	$(MAKE) -C httpd all

$(HOME)/usr/local/apache2/bin/httpd: httpd/httpd
	$(MAKE) -C httpd install

/usr/local/apache2/bin/httpd: httpd/httpd
	sudo $(MAKE) -C httpd install

# Help text header.
HELP_TEXT = $(info Apache HTTP Server)

# Public targets.
HELP_TEXT += $(info [httpd-stable.tar.gz] Latest stable Apache HTTP server source distribution.)
httpd-stable.tar.gz: httpd-v2.4.16.tar.gz
	ln -s $< $@

HELP_TEXT += $(info [install-sys] Install Apache HTTP server for all users (requires root privileges).)
install-sys: /usr/local/apache2/bin/httpd

HELP_TEXT += $(info [install-home] Install Apache HTTP server in your home directory.)
install-home: $(HOME)/usr/local/apache2/bin/httpd

.PHONY: clean help

# Delete build artifacts.
clean:
	rm -rf httpd* KEY

# Display help text.
help:
	$(HELP_TEXT)
	@true
