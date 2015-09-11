#!/bin/sh

# Test script.

set -e

# Test private targets.
make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3

make 39FF092C
make -q 39FF092C

make apr-v1.5.2-UNVERIFIED.tar.gz
make -q apr-v1.5.2-UNVERIFIED.tar.gz

make apr-v1.5.2.tar.gz.asc
make -q apr-v1.5.2.tar.gz.asc

make apr-v1.5.2.tar.gz
make -q apr-v1.5.2.tar.gz

make apr-util-v1.5.4-UNVERIFIED.tar.gz
make -q apr-util-v1.5.4-UNVERIFIED.tar.gz

make apr-util-v1.5.4.tar.gz.asc
make -q apr-util-v1.5.4.tar.gz.asc

make apr-util-v1.5.4.tar.gz
make -q apr-util-v1.5.4.tar.gz

# Test public targets.
make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3

make apr.tar.gz
make -q apr.tar.gz

make apr-util.tar.gz
make -q apr-util.tar.gz

make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3
