#!/usr/bin/env bash

# Delete some unneeded stuff:
# * remove external/
rm -rf external

# * Delete everything under examples/, but keep directory
rm -rf examples/*


# libtool-ized automake sources
cp -p patches/configure.ac                .
cp -p patches/Makefile.am                 Makefile.am
cp -p patches/src-Makefile.am             src/Makefile.am
cp -p patches/src-reg-Makefile.am         src-reg/Makefile.am
cp -p patches/lib-src-Makefile.am         lib-src/Makefile.am
cp -p patches/lib-src-reg-Makefile.am     lib-src-reg/Makefile.am
cp -p patches/wrap-gmp-gmpxx-Makefile.am  wrap-gmp-gmpxx/Makefile.am

# Makefile.am with all examples deleted to save disk space
cp -p "$PATCHES"/examples-Makefile.am     examples/Makefile.am

# regenerate auto-generated files
libtoolize   # only needed because of our broken autotools package
autoreconf -fiv
#rm -rf autom4te.cache
./configure
