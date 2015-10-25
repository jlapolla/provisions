#!/bin/sh

set -e

d=bootstrap/
make="make -f test/bootstrap.mk"

targets=
targets="$targets $d"bootstrap-v3.3.5.min.css
targets="$targets $d"bootstrap-v3.3.5.min.js
targets="$targets $d"bootstrap-theme-v3.3.5.min.css
targets="$targets $d"bootstrap.min.css
targets="$targets $d"bootstrap.min.js
targets="$targets $d"bootstrap-theme.min.css

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2
