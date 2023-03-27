# Example rbuild file. You should remove comments when making a real
# build file to keep it readable.

# NOTE: pkg_name.rbuild should not contain any shebang and should not
# be made executable.

# Name of the package
PKG_NAME=""

# Package's version. If the source is from Debian, make sure to verify
# the version number properly.
VERSION=""

# Where the source is fetched. This can be "debian", in which case the
# source will be fetched using apt-get source <package-name>, or a url
# to the source's tarball (e.g. in github releases).
SRC=""

# A whitespace or new-line separated list of patches to apply, if any
# are present. Patches should be listed in the order in which they are
# to be applied.
PATCHES="patch1 patch2"

# Remove if there's no need for it
prepare() {
	# Some packages may need specific commands to be run before
	# the build can be started. This function, if present, gets
	# executed after the source was fetched, build dependencies
	# were installed, and the package was patched.
	#
	# An example of what commands can be run here would be:
	#
	# cp control <source-dir>/debian/
	# cp changelog <source-dir>/debian/

	# This would be done when maintaining a custom version of a
	# package that already exists in Debian, where the control
	# and changelog files should be customized accordingly.

	# This function can also be used to make minor modifications
	# to the package's source. For example, if the only modification
	# to a source package is a simple word in its Makefile, creating
	# a patch for it would be rather pointless.
}

# Build the package
do_build() {
	# Debian provides various commands to build a package, e.g.
	# debuild, dpkg-buildpackage. Each has their own options
	# that may or may not be needed. It's better to have each
	# individual port use its own command rather than handling
	# it in the mkpkg script. 
	#
	# When in doubt, use the standard command:
	#
	# debuild -i -us -uc -b
}

# Cleaning after the package was built
cleanup() {
	# Although every package directory in the ports tree has a
	# .gitignore file which ignores everything that shouldn't
	# be tracked through git, it is a good idea to clean up all
	# files that were created by the build process.

	# For example, remove the .dsc and .changes files as well as
	# the package's source directory. If you'd rather keep all
	# these files, then simply add a 'colon # no-op' in this
	# function. e.g.

	: # no-op
}
