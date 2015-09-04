# Export shared resource paths.
# Common Make functions.
export MK_COMMON := $(abspath common.mk)

# Include common Make functions.
include $(MK_COMMON)

# Recurse into subdirectories.
SUBDIRS :=
$(foreach VAR,$(SUBDIRS),$(eval $(call RECURSE,$(VAR))))

.PHONY: clean help

# Delete build artifacts.
clean: $(addsuffix /clean,$(SUBDIRS))

# Display help text.
help: $(addsuffix /help,$(SUBDIRS))