Port
====

Ragnarok's port system. This should not be used. It will be restructured
at some point, but there are more important things to be done first.

Old Instructions
================

This is Ragnarok's ports system/tree.

Structure
---------

Each package directory should contain at least a build script (r-build),
alternative control and changelog file and a .gitignore file. If patches
are needed, they should be in a *patches* subdirectory.

In order to keep the tree clean and avoid mistakenly tracking unnecessary
files, .gitignore should be formatted to ignore everything but the files
mentionned above. e.g.

```
# ignore everything
*

# except these files
!<package-name>.rbuild
!.gitignore
!changelog
!control
!patches/
!patches/*
```

Equivs
------

Directories starting with *no-* are for dummy packages built with equivs.
These are used to satisfy hard dependencies that are not actually needed
becaise Ragnarok uses an alternative (e.g. mandoc instead of man-db).
Essentially, these are empty packages meant to trick apt into thinking
the actual program is installed. The real version of these packages can
still be installed with apt remove *pkg_name* && apt install *pkg_name*.

mkpkg
-----

mkpkg is used to build packages. When no package name is given as arguments
to the -b and -u options, mkpkg will build or update all packages listed in
pkgs.list.

For more details on mkpg, run 

```
mkpkg -h
```
