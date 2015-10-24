#!/bin/sh

set -e

d=cpanm/
make="make -f test/cpanm.mk"

targets=
targets="$targets $d"cpanm.pl

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2
