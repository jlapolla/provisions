#!/bin/sh

set -e

d=apache/apr/
make="make -f test/apr.mk"

targets=
targets="$targets 39FF092C"
targets="$targets apr-v1.5.2-UNVERIFIED.tar.gz"
targets="$targets apr-v1.5.2.tar.gz.asc"
targets="$targets apr-v1.5.2.tar.gz"
targets="$targets apr-util-v1.5.4-UNVERIFIED.tar.gz"
targets="$targets apr-util-v1.5.4.tar.gz.asc"
targets="$targets apr-util-v1.5.4.tar.gz"
targets="$targets apr.tar.gz"
targets="$targets apr-util.tar.gz"

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 2

for target in $targets; do
  ! $make -q $d"$target"
  $make $d"$target"
  $make -q $d"$target"
done

$make $d"clean"
test `find $d -mindepth 1 -maxdepth 1 ! -name '*.swp' | wc -w` = 2
