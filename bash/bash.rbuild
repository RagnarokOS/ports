# Self-explanatory
PKG_NAME="bash"
VERSION="5.2.15"
SRC="debian"

prepare() {
	# The skel.profile file provided by bash conflicts with the one
	# provided by ragnarok-files, preventing either package from 
	# installing/upgrading. Remove this file from bash, as the one
	# from ragnarok-files is the one that matters.
	rm "$PKG_NAME"-"$VERSION"/debian/skel.profile
	sed -i '/skel\.profile/d' "$PKG_NAME"-"$VERSION"/debian/rules

	# Handling the .aliases file
	printf '%s\n' "
# source ~/.aliases if it exists
if [ -f ~/.aliases ]; then
. ~/.aliases
fi" >> "$PKG_NAME"-"$VERSION"/debian/skel.bashrc
	
	# Now, generate new changelog
	cd "$PKG_NAME"-"$VERSION" && dch -n && cd ..
}

# Build the package
do_build() {
	debuild -i -us -uc -b
}

do_clean() {
	dh_clean
}
