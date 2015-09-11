#!/bin/sh

# Test script.

set -e

# Test private targets.
make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3

make bootstrap-v3.3.5.min.css
make -q bootstrap-v3.3.5.min.css

make bootstrap-v3.3.5.min.js
make -q bootstrap-v3.3.5.min.js

make bootstrap-theme-v3.3.5.min.css
make -q bootstrap-theme-v3.3.5.min.css

# Test public targets
make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3

make bootstrap.min.css
make -q bootstrap.min.css

make bootstrap.min.js
make -q bootstrap.min.js

make bootstrap-theme.min.css
make -q bootstrap-theme.min.css

make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3
