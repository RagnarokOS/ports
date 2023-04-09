PKG_NAME="ragnarok-files"
VERSION="0.1"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/src.git"

# the source for ragnarok-files comes from src, so the directory needs
# to be renamed to ragnarok-files-$VERSION
prepare() {
	mv src "$PKG_NAME"-"$VERSION"
}

do_build() {
	debuild -i -us -uc -b
}

do_clean() {
	dh_clean
}
