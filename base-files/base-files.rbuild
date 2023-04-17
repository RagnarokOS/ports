PKG_NAME="base-files"
VERSION="12.4"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/base-files.git"

do_build() {
	debuild -i -us -uc -b
}
