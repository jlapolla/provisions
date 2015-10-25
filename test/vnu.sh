#!/bin/sh

set -e

sudo apt-get update || true
sudo apt-get install -y unzip || true

d=vnu/
make="make -f test/vnu.mk"

targets=
targets="$targets $d"BC3A4B95
targets="$targets $d"vnu-v15.6.29-UNVERIFIED.zip
targets="$targets $d"vnu-v15.6.29.zip.asc
targets="$targets $d"vnu-v15.6.29.zip
targets="$targets $d"vnu-v15.6.29.jar
targets="$targets $d"vnu.jar

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2
