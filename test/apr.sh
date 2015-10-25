#!/bin/sh

set -e

d=apache/httpd/apr/
make="make -f test/apr.mk"

targets=
targets="$targets $d"39FF092C
targets="$targets $d"apr-v1.5.2-UNVERIFIED.tar.gz
targets="$targets $d"apr-v1.5.2.tar.gz.asc
targets="$targets $d"apr-v1.5.2.tar.gz
targets="$targets $d"apr-util-v1.5.4-UNVERIFIED.tar.gz
targets="$targets $d"apr-util-v1.5.4.tar.gz.asc
targets="$targets $d"apr-util-v1.5.4.tar.gz
targets="$targets $d"apr.tar.gz
targets="$targets $d"apr-util.tar.gz

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2
