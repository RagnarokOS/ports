PKG_NAME="base-files"
VERSION="12.4"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/base-files.git"

prepare() {
	mv base-files base-files-"$VERSION"
}

do_build() {
	debuild -i -us -uc -b
}
