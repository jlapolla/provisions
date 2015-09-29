# MODULE EXTENSION
# ext_httpd_install - install Apache HTTP server at prefix
#
# USAGE
# $(call ext_httpd_install,[<prefix>],[<version>])
#
# DESCRIPTION
# Creates targets with rules to build and install Apache HTTP server at
# the supplied <prefix>. Returns the name of the ultimate installation
# build target.
#
# ARGUMENTS
# <prefix> [OPTIONAL]
# Prefix where Apache HTTP server will be installed. <prefix> MUST
# contain a trailing slash. Defaults to /usr/local/apache2/.
#
# <version> [OPTIONAL]
# Version of Apache HTTP server to install. Defaults to version 2.4.16.
#
# RETURNS
# The name of the ultimate installation build target. Building this
# target installs Apache HTTP server at the <prefix>.
#
# VARIABLES
# $(__ext_httpd_install_d) [PRIVATE]
# Cached version of the magic $(d) variable.
#
# $(__ext_httpd_install_base_dir) [PRIVATE]
# Base directory for Apache HTTP server downloads and builds.
#
# $(__ext_httpd_install_setvars) [PRIVATE]
# Function evaluated to set derived variables before expanding
# __ext_httpd_install_template.
#
# $(__ext_httpd_install_prefix) [PRIVATE]
# The installation prefix where Apache HTTP server will be installed.
#
# $(__ext_httpd_install_version) [PRIVATE]
# The version of Apache HTTP server that will be installed.
#
# $(__ext_httpd_install_hash) [PRIVATE]
# Unique hash for this particular build. Computed from <prefix> and
# <version>.
#
# $(__ext_httpd_install_build_dir) [PRIVATE]
# Path to directory where this Apache server will be compiled.
#
# $(__ext_httpd_install_template) [PRIVATE]
# Target rules template. This is expanded and eval'd after running
# __ext_httpd_install_setvars.


# Set constants
__ext_httpd_install_d := $(d)
__ext_httpd_install_base_dir := $(dir $(patsubst %/,%,$(__ext_httpd_install_d)))apache/httpd/

# Set variables function
define __ext_httpd_install_setvars
$(eval include helpdoc.mk)
$(eval include hash4.mk)
$(eval __ext_httpd_install_prefix := $(1))
$(eval __ext_httpd_install_version := $(2))
$(eval __ext_httpd_install_hash := $(call hash4,$(__ext_httpd_install_prefix)$(__ext_httpd_install_version)))
$(eval __ext_httpd_install_build_dir := $(__ext_httpd_install_base_dir)build-$(__ext_httpd_install_hash)/)
endef

# Rules template
define __ext_httpd_install_template
# Specific rules
$(__ext_httpd_install_build_dir)httpd/README: $(__ext_httpd_install_base_dir)httpd-v$(__ext_httpd_install_version).tar.gz
	mkdir -p $(__ext_httpd_install_build_dir)
	rm -rf $(__ext_httpd_install_build_dir)httpd/
	tar -C $(__ext_httpd_install_build_dir) --no-same-owner -xzmf $$<
	mv $(__ext_httpd_install_build_dir)httpd-$(__ext_httpd_install_version)/ $(__ext_httpd_install_build_dir)httpd/

$(__ext_httpd_install_build_dir)httpd/srclib/apr/README: $(__ext_httpd_install_base_dir)apr/apr-v1.5.2.tar.gz $(__ext_httpd_install_build_dir)httpd/README
	mkdir -p $(__ext_httpd_install_build_dir)httpd/srclib/
	rm -rf $(__ext_httpd_install_build_dir)httpd/srclib/apr/
	tar -C $(__ext_httpd_install_build_dir)httpd/srclib/ --no-same-owner -xzmf $$<
	mv $(__ext_httpd_install_build_dir)httpd/srclib/apr-1.5.2/ $(__ext_httpd_install_build_dir)httpd/srclib/apr/

$(__ext_httpd_install_build_dir)httpd/srclib/apr-util/README: $(__ext_httpd_install_base_dir)apr/apr-util-v1.5.4.tar.gz $(__ext_httpd_install_build_dir)httpd/README
	mkdir -p $(__ext_httpd_install_build_dir)httpd/srclib/
	rm -rf $(__ext_httpd_install_build_dir)httpd/srclib/apr-util/
	tar -C $(__ext_httpd_install_build_dir)httpd/srclib/ --no-same-owner -xzmf $$<
	mv $(__ext_httpd_install_build_dir)httpd/srclib/apr-util-1.5.4/ $(__ext_httpd_install_build_dir)httpd/srclib/apr-util/

$(__ext_httpd_install_build_dir)httpd/Makefile: $(__ext_httpd_install_build_dir)httpd/README $(__ext_httpd_install_build_dir)httpd/srclib/apr/README $(__ext_httpd_install_build_dir)httpd/srclib/apr-util/README
	cd $(__ext_httpd_install_build_dir)httpd/ && ./configure --with-included-apr --prefix=$(__ext_httpd_install_prefix)

$(__ext_httpd_install_build_dir)httpd/httpd: $(__ext_httpd_install_build_dir)httpd/Makefile
	$$(MAKE) -C $(__ext_httpd_install_build_dir)httpd/ all

$(call helpdoc,$(__ext_httpd_install_prefix)bin/httpd,Install Apache HTTP Server version $(__ext_httpd_install_version) at prefix "$(__ext_httpd_install_prefix)")
$(__ext_httpd_install_prefix)bin/httpd: $(__ext_httpd_install_build_dir)httpd/httpd
	$$(MAKE) -C $(__ext_httpd_install_build_dir)httpd/ install

endef

# Define extension function
ext_httpd_install = $(strip $(if $(1),,$(eval 1 := /usr/local/apache2/))$(if $(2),,$(eval 2 := 2.4.16))$(call __ext_httpd_install_setvars,$(1),$(2))$(eval $(call __ext_httpd_install_template))$(1)bin/httpd)
