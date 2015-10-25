#!/bin/sh

set -e

d=nodejs/
make="make -f test/ext_nodejs_install.mk"
basedir=`pwd`/tmp/node-v4.2.1-linux-x86/bin/

targets=
targets="$targets $basedir"node
targets="$targets $basedir"npm

mkdir tmp/

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q "$target"
  $make "$target"
  $make -q "$target"
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

rm -rf tmp/
