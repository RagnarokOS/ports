# Self-explanatory
PKG="oksh"
VERSION="7.3"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/oksh.git"

prepare() {
	mv oksh oksh-"$VERSION"
}

# Build the package
do_build() {
	debuild -i -us -uc -b
}

do_clean() {
	dh_clean
	make clean
	make distclean
}
