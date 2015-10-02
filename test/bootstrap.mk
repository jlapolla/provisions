include require.mk

$(call ,$(call require,$(d)bootstrap/Makefile))

include helpdoc.mk

.DEFAULT_GOAL := help
