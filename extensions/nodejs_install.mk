# Set constants
__ext_nodejs_install_d := $(d)

# Set variables function
define __ext_nodejs_install_setvars
$(eval __ext_nodejs_install_prefix := $(if $(1),$(1),/usr/local/))
$(eval __ext_nodejs_install_version := $(if $(2),$(2),4.2.1))
$(eval __ext_nodejs_install_bits := $(if $(filter-out 32,$(3)),$(if $(filter-out 64,$(3)),$(if $(3),$(error Third argument to ext_nodejs_install must be "32" or "64"),),64),86))
$(eval __ext_nodejs_install_base := $(__ext_nodejs_install_prefix)node-v$(__ext_nodejs_install_version)-linux-x$(__ext_nodejs_install_bits)/)
endef

# Rules template
define __ext_nodejs_install_template
$(eval include helpdoc.mk)

$(call helpdoc,$(__ext_nodejs_install_base)bin/node,Install Node.js v$(__ext_nodejs_install_version) at prefix "$(__ext_nodejs_install_prefix)")
$(__ext_nodejs_install_base)bin/node: $(dir $(patsubst %/,%,$(__ext_nodejs_install_d)))nodejs/node-v$(__ext_nodejs_install_version)-x$(__ext_nodejs_install_bits).tar.gz
	if test -w $(__ext_nodejs_install_prefix) ; then tar -C $(__ext_nodejs_install_prefix) -xzmf $$< ; else sudo tar -C $(__ext_nodejs_install_prefix) -xzmf $$< ; fi

$(call helpdoc,$(__ext_nodejs_install_base)bin/npm)
$(__ext_nodejs_install_base)bin/npm: | $(__ext_nodejs_install_base)bin/node
endef

# Define extension function
ext_nodejs_install = $(strip $(call __ext_nodejs_install_setvars,$(1),$(2),$(3))$(eval $(call __ext_nodejs_install_template))$(__ext_nodejs_install_base)bin/node $(__ext_nodejs_install_base)bin/npm)
