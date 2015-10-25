include require.mk

$(call ,$(call require,$(d)nodejs/Makefile))
$(call ,$(call require,$(d)extensions/nodejs_install.mk))

# Configure extensions
$(call ,$(call ext_nodejs_install,$(shell pwd)/tmp/))
$(call ,$(call ext_nodejs_install,$(shell pwd)/TMP/))# Unused configuration
