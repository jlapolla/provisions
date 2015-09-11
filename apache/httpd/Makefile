# Include common Make functions.
include $(MK_COMMON)

# Recurse into subdirectories.
$(eval $(call RECURSE,..))

# Private variables.
MIRROR := http://mirror.cogentco.com/pub/apache
APACHE := https://www.apache.org/dist

# Private targets.
791485A8:
	$(call GPG_RECV_KEY,$@,$@)

httpd-v2.4.16-UNVERIFIED.tar.gz:
	$(call DOWNLOAD,$(MIRROR)/httpd/httpd-2.4.16.tar.gz,$@)

httpd-v2.4.16.tar.gz.asc:
	$(call DOWNLOAD,$(APACHE)/httpd/httpd-2.4.16.tar.gz.asc,$@)

httpd-v2.4.16.tar.gz: httpd-v2.4.16.tar.gz.asc httpd-v2.4.16-UNVERIFIED.tar.gz | 791485A8
	gpg --verify $^
	cp $(lastword $^) $@

httpd-v2.4.16/README: httpd-v2.4.16.tar.gz ../apr/apr-v1.5.2.tar.gz ../apr/apr-util-v1.5.4.tar.gz
	rm -rf httpd
	tar --no-same-owner -xzmf httpd-v2.4.16.tar.gz
	tar --no-same-owner -xzmf ../apr/apr-v1.5.2.tar.gz
	tar --no-same-owner -xzmf ../apr/apr-util-v1.5.4.tar.gz
	mv httpd-2.4.16 httpd-v2.4.16
	mv apr-1.5.2 httpd-v2.4.16/srclib/apr
	mv apr-util-1.5.4 httpd-v2.4.16/srclib/apr-util

ifeq ($(MAKECMDGOALS),install-home)
httpd-v2.4.16/Makefile: httpd-v2.4.16/README
	cd httpd-v2.4.16 && ./configure --with-included-apr --prefix="$(HOME)/usr/local/apache2"
else
httpd-v2.4.16/Makefile: httpd-v2.4.16/README
	cd httpd-v2.4.16 && ./configure --with-included-apr
endif

httpd-v2.4.16/httpd: httpd-v2.4.16/Makefile
	$(MAKE) -C httpd-v2.4.16 all

$(HOME)/usr/local/apache2/bin/httpd: httpd-v2.4.16/httpd
	$(MAKE) -C httpd-v2.4.16 install

/usr/local/apache2/bin/httpd: httpd-v2.4.16/httpd
	sudo $(MAKE) -C httpd-v2.4.16 install

# Help text header.
HELP_TEXT = $(info Apache HTTP Server)
HELP_TEXT += $(info URL: https://httpd.apache.org/)

# Public targets.
HELP_TEXT += $(info [httpd.tar.gz] Latest stable Apache HTTP server source.)
httpd.tar.gz: httpd-v2.4.16.tar.gz
	ln -sf $< $@

HELP_TEXT += $(info [install-sys] Install Apache HTTP server under /usr/local/apache2 (requires root privileges).)
install-sys: /usr/local/apache2/bin/httpd

HELP_TEXT += $(info [install-home] Install Apache HTTP server under ~/usr/local/apache2.)
install-home: $(HOME)/usr/local/apache2/bin/httpd

.PHONY: clean help test install-sys install-home

# Delete build artifacts.
clean:
	rm -rf apr* httpd* 791485A8

# Display help text.
help:
	$(HELP_TEXT)
	@true

# Run test script.
test:
	./test.sh

# Display help by default.
.DEFAULT_GOAL := help
