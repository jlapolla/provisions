# Include common Make functions.
include $(MK_COMMON)

# Private targets.
cpanm.pl:
	$(call DOWNLOAD,https://cpanmin.us,$@)

/usr/local/bin/cpanm: cpanm.pl
	sudo perl $< App::cpanminus
	touch -c $@

# Help text header.
HELP_TEXT = $(info App::cpanminus Perl Package Manager)
HELP_TEXT += $(info URL: http://search.cpan.org/~miyagawa/App-cpanminus/lib/App/cpanminus.pm)

# Public targets.
HELP_TEXT += $(info [install-sys] Install cpanm for all users (requires root privileges).)
install-sys: /usr/local/bin/cpanm

.PHONY: clean help install-sys

# Delete build artifacts.
clean:
	rm -rf cpanm*

# Display help text.
help:
	$(HELP_TEXT)
	@true
