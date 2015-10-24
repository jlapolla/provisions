include require.mk

$(call ,$(call require,$(d)jquery/Makefile))

include helpdoc.mk

.DEFAULT_GOAL := help
