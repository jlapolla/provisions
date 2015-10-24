#!/bin/sh

set -e

d=jquery/
make="make -f test/jquery.mk"

targets=
targets="$targets $d"jquery-1.11.3.min.js
targets="$targets $d"jquery-2.1.4.min.js
targets="$targets $d"jquery.min.js
targets="$targets $d"jquery-v1.min.js
targets="$targets $d"jquery-v2.min.js

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2
