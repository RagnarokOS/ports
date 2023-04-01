PKG_NAME="base-files"
VERSION="12.4"
SRC="debian"

PATCHES="0001_ragnarok.diff"

# Fetch the source, install build dependencies and copy the control/changelog files.
prepare() {
	cp control "$PKG_NAME"-"$VERSION"/debian/
	cp changelog "$PKG_NAME"-"$VERSION"/debian/
}

do_build() {
	debuild -i -us -uc -b
}

# Update package to new version
do_update() {
	prepare
	cd "$PKG_NAME"-* && dch -n && cd ..
	cp "$PKG_NAME"-*/debian/changelog .
	cp "$PKG_NAME"-*/debian/control .
	do_patch
	cd "$PKG_NAME"-* && debuild -i -us -uc -b && cd ..
}

# Clean the directory.
cleanup() {
	rm -rf "$PKG_NAME"-"$VERSION"
	for _file in "$PKG_NAME"_*; do rm "$_file"; done
}
