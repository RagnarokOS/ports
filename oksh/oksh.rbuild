#!/bin/sh

# Self-explanatory
PKG="oksh"
VERSION="7.2"
SRC="https://github.com/I-LeCorbeau/oksh/releases/download/$VERSION/oksh-$VERSION.tar.gz"

# Build the package
do_build() {
	debuild -i -us -uc -b
}

do_clean() {
	dh_clean
	make clean
	make distclean
}
