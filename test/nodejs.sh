#!/bin/sh

set -e

d=nodejs/
make="make -f test/nodejs.mk"

targets=
targets="$targets $d"node-v4.2.1-x86.tar.gz
targets="$targets $d"node-v4.2.1-x64.tar.gz
targets="$targets $d"node-x86.tar.gz
targets="$targets $d"node-x64.tar.gz

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2
