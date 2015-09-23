#!/bin/sh

set -e

d=apache/httpd/
make="make -f test/httpd.mk"

targets=
targets="$targets 791485A8"
targets="$targets httpd-v2.4.16-UNVERIFIED.tar.gz"
targets="$targets httpd-v2.4.16.tar.gz.asc"
targets="$targets httpd-v2.4.16.tar.gz"
targets="$targets httpd.tar.gz"

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 3

for target in $targets; do
  ! $make -q $d"$target"
  $make $d"$target"
  $make -q $d"$target"
done

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 3

