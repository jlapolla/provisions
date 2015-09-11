#!/bin/sh

# Test script.

set -e

# Install required software.
sudo apt-get update
sudo apt-get install -y libpcre3-dev bison flex

# Test private targets.
make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3

make 791485A8
make -q 791485A8

make httpd-v2.4.16-UNVERIFIED.tar.gz
make -q httpd-v2.4.16-UNVERIFIED.tar.gz

make httpd-v2.4.16.tar.gz.asc
make -q httpd-v2.4.16.tar.gz.asc

make httpd-v2.4.16.tar.gz
make -q httpd-v2.4.16.tar.gz

make httpd-v2.4.16/README
make -q httpd-v2.4.16/README

make httpd-v2.4.16/Makefile
make -q httpd-v2.4.16/Makefile

make httpd-v2.4.16/httpd
make -q httpd-v2.4.16/httpd

# Test public targets
make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3

make httpd.tar.gz
make -q httpd.tar.gz

make install-sys
make -q install-sys

make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3

make install-home
make -q install-home

make clean
test `find . -mindepth 1 -maxdepth 1 ! -name '*.swp' | sed 's:^\./::' | wc -w` = 3
