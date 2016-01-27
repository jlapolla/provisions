#!/bin/sh

set -e

d=ui-router/
make="make -f test/ui-router.mk"

targets=
targets="$targets $d"angular-ui-router-0.2.17.min.js

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

