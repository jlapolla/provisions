# Set constants
__ext_nodejs_install_d := $(d)

# Set variables function
define __ext_nodejs_install_setvars
$(eval include helpdoc.mk)
$(eval include hash4.mk)
$(eval __ext_nodejs_install_prefix := $(1))
$(eval __ext_nodejs_install_version := $(2))
endef

# Rules template
define __ext_nodejs_install_template
$(__ext_nodejs_install_build_dir)httpd/README: $(__ext_nodejs_install_base_dir)httpd-v$(__ext_nodejs_install_version).tar.gz
	mkdir -p $(__ext_nodejs_install_build_dir)
	rm -rf $(__ext_nodejs_install_build_dir)httpd/
	tar -C $(__ext_nodejs_install_build_dir) --no-same-owner -xzmf $$<
	mv $(__ext_nodejs_install_build_dir)httpd-$(__ext_nodejs_install_version)/ $(__ext_nodejs_install_build_dir)httpd/

$(__ext_nodejs_install_build_dir)httpd/srclib/apr/README: $(__ext_nodejs_install_base_dir)apr/apr-v1.5.2.tar.gz $(__ext_nodejs_install_build_dir)httpd/README
	mkdir -p $(__ext_nodejs_install_build_dir)httpd/srclib/
	rm -rf $(__ext_nodejs_install_build_dir)httpd/srclib/apr/
	tar -C $(__ext_nodejs_install_build_dir)httpd/srclib/ --no-same-owner -xzmf $$<
	mv $(__ext_nodejs_install_build_dir)httpd/srclib/apr-1.5.2/ $(__ext_nodejs_install_build_dir)httpd/srclib/apr/

$(__ext_nodejs_install_build_dir)httpd/srclib/apr-util/README: $(__ext_nodejs_install_base_dir)apr/apr-util-v1.5.4.tar.gz $(__ext_nodejs_install_build_dir)httpd/README
	mkdir -p $(__ext_nodejs_install_build_dir)httpd/srclib/
	rm -rf $(__ext_nodejs_install_build_dir)httpd/srclib/apr-util/
	tar -C $(__ext_nodejs_install_build_dir)httpd/srclib/ --no-same-owner -xzmf $$<
	mv $(__ext_nodejs_install_build_dir)httpd/srclib/apr-util-1.5.4/ $(__ext_nodejs_install_build_dir)httpd/srclib/apr-util/

$(__ext_nodejs_install_build_dir)httpd/Makefile: $(__ext_nodejs_install_build_dir)httpd/README $(__ext_nodejs_install_build_dir)httpd/srclib/apr/README $(__ext_nodejs_install_build_dir)httpd/srclib/apr-util/README
	cd $(__ext_nodejs_install_build_dir)httpd/ && ./configure --with-included-apr --prefix=$(__ext_nodejs_install_prefix)

$(__ext_nodejs_install_build_dir)httpd/httpd: $(__ext_nodejs_install_build_dir)httpd/Makefile
	$$(MAKE) -C $(__ext_nodejs_install_build_dir)httpd/ all

$(call helpdoc,$(__ext_nodejs_install_prefix)bin/httpd,Install Apache HTTP Server version $(__ext_nodejs_install_version) at prefix "$(__ext_nodejs_install_prefix)")
$(__ext_nodejs_install_prefix)bin/httpd: $(__ext_nodejs_install_build_dir)httpd/httpd
	$$(MAKE) -C $(__ext_nodejs_install_build_dir)httpd/ install


endef

# Define extension function
ext_nodejs_install = $(strip $(if $(1),,$(eval 1 := /usr/local/))$(if $(2),,$(eval 2 := 4.2.1))$(call __ext_nodejs_install_setvars,$(1),$(2))$(eval $(call __ext_nodejs_install_template))$(1)bin/httpd)
