PKG_NAME="hardened-malloc"
VERSION="11"
SRC="git"
GIT_SRC="https://github.com/RagnarokOS/hardened-malloc.git"

prepare() {
	# The source bing cloned from git means the directory doesn't contain
	# the package's version, so mkpkg can't cd into it. Renaming the dir
	# will fix that issue
	mv hardened-malloc hardened-malloc-"$VERSION"
}

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
