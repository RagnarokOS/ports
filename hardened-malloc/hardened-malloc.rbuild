PKG_NAME="hardened-malloc"
VERSION="11"
SRC=""	# Release not ready yet.

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
