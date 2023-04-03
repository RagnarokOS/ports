PKG_NAME="signify-openbsd"
VERSION="31-3"
SRC="debian"

# Fetch the source, install build dependencies and copy the control/changelog files.
prepare() {
	cp control "$PKG_NAME"-"$VERSION"/debian/
	cp changelog "$PKG_NAME"-"$VERSION"/debian/
	cp postinst "$PKG_NAME"-"$VESION"/debian/
}

# Build the package
do_build() {
	debuild -i -us -uc -b
}

# Clean the directory.
cleanup() {
	rm -rf "$PKG_NAME"-*
	for _file in "$PKG_NAME"_*; do rm "$_file"; done
}
