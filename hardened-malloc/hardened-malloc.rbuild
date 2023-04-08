PKG_NAME="hardened-malloc"
VERSION="11"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/hardened-malloc.git"

# Build
do_build() {
	debuild -i -us -uc -b
}

# Cleaning up
do_clean() {
	dh_clean
	make clean
	rm -rf out-*
	rm -r ../{*.build,*.buildinfo,*.changes,*.deb}
}
