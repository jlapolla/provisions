# Include common Make functions.
include $(MK_COMMON)

# Recurse into subdirectories.
SUBDIRS := apr
$(foreach VAR,$(SUBDIRS),$(eval $(call RECURSE,$(VAR))))

.PHONY: clean help

# Delete build artifacts.
clean: $(addsuffix /clean,$(SUBDIRS))

# Display help text.
help: $(addsuffix /help,$(SUBDIRS))

# Display help by default.
.DEFAULT_GOAL := help
