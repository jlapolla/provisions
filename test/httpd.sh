#!/bin/sh

set -e

d=apache/httpd/
make="make -f test/httpd.mk"

targets=
targets="$targets $d"791485A8
targets="$targets $d"httpd-v2.4.17-UNVERIFIED.tar.gz
targets="$targets $d"httpd-v2.4.17.tar.gz.asc
targets="$targets $d"httpd-v2.4.17.tar.gz
targets="$targets $d"httpd.tar.gz

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 3

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 3

