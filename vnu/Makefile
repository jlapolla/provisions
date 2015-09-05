# Include common Make functions.
include $(MK_COMMON)

# Private targets.
BC3A4B95:
	$(call GPG_RECV_KEY,$@,$@)

vnu-v15.6.29-UNVERIFIED.zip:
	$(call DOWNLOAD,https://github.com/validator/validator/releases/download/15.6.29/vnu.jar_15.6.29.zip,$@)

vnu-v15.6.29.zip.asc:
	$(call DOWNLOAD,https://github.com/validator/validator/releases/download/15.6.29/vnu.jar_15.6.29.zip.asc,$@)

vnu-v15.6.29.zip: vnu-v15.6.29.zip.asc vnu-v15.6.29-UNVERIFIED.zip | BC3A4B95
	gpg --verify $^
	cp $(lastword $^) $@

vnu-v15.6.29.jar: vnu-v15.6.29.zip
	unzip -p $< dist/vnu.jar > $@

# Help text header.
HELP_TEXT = $(info v.Nu HTML Validator)
HELP_TEXT += $(info URL: https://validator.github.io/validator/) 

# Public targets.
HELP_TEXT += $(info [vnu-stable.jar] Latest stable v.Nu JAR.)
vnu-stable.jar: vnu-v15.6.29.jar
	ln -s $< $@

.PHONY: clean help

# Delete build artifacts.
clean:
	rm -rf BC3A4B95 vnu.jar*

# Display help text.
help:
	$(HELP_TEXT)
	@true
