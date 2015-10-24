include require.mk

$(call ,$(call require,$(d)cpanm/Makefile))

include helpdoc.mk

.DEFAULT_GOAL := help
