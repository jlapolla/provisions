#!/bin/sh

set -e

sudo apt-get update || true
sudo apt-get install -y libpcre3-dev bison flex || true

d=apache/httpd/
make="make -f test/ext_httpd_install.mk"
build_dir=$d"build-`$make hash`/"

targets=
targets="$targets $build_dir"httpd/README
targets="$targets $build_dir"httpd/srclib/apr/README
targets="$targets $build_dir"httpd/srclib/apr-util/README
targets="$targets $build_dir"httpd/Makefile
targets="$targets $build_dir"httpd/httpd
targets="$targets `pwd`/tmp/bin/httpd"

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 3

for target in $targets; do
  ! $make -q "$target"
  $make "$target"
  $make -q "$target"
done

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 3

rm -rf tmp/
