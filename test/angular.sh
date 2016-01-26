#!/bin/sh

set -e

d=angular/
make="make -f test/angular.mk"

targets=
targets="$targets $d"angular-1.4.9.min.js
targets="$targets $d"angular-animate-1.4.9.min.js
targets="$targets $d"angular-aria-1.4.9.min.js
targets="$targets $d"angular-cookies-1.4.9.min.js
targets="$targets $d"angular-csp-1.4.9.css
targets="$targets $d"angular-loader-1.4.9.min.js
targets="$targets $d"angular-message-format-1.4.9.min.js
targets="$targets $d"angular-messages-1.4.9.min.js
targets="$targets $d"angular-mocks-1.4.9.js
targets="$targets $d"angular-resource-1.4.9.min.js
targets="$targets $d"angular-route-1.4.9.min.js
targets="$targets $d"angular-sanitize-1.4.9.min.js
targets="$targets $d"angular-scenario-1.4.9.js
targets="$targets $d"angular-touch-1.4.9.min.js

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2

for target in $targets; do
  ! $make -q $target
  $make $target
  $make -q $target
done

$make $d"clean"
test `find $d -type f ! -name '*.swp'| wc -l` = 2
