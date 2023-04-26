# Self-explanatory
PKG_NAME="bash"
VERSION="5.2.15-2"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/bash.git"

prepare() {
	mv bash bash-"$VERSION"
}

# Build the package
do_build() {
	debuild -i -us -uc -b
}

do_clean() {
	dh_clean
}
