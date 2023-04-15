#!/bin/sh

# Self-explanatory
PKG="oksh"
VERSION="7.2"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/oksh.git"

# Build the package
do_build() {
	debuild -i -us -uc -b
}

do_clean() {
	dh_clean
	make clean
	make distclean
}
