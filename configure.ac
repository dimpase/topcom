dnl Process this file with autoconf to produce a configure script.
AC_INIT([TOPCOM],[0.17.8])
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([lib-src-reg/LPinterface.hh])

dnl Checks for programs.
AC_PROG_CC
AC_PROG_CXX
AC_PROG_INSTALL
LT_INIT

dnl Checks for header files.
AC_HEADER_STDC

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST


dnl ===== Begin checks for libraries ================

dnl Removed check for soplex because SPXinterface will not compile with
dnl Soplex 2.0.1.  (Header file spxdefaultpr.h does not exist any more.)
dnl dnl Check for soplex:
dnl AC_TRY_LINKCHECK_LIB(soplex, main, ,
dnl              [csh -c 'echo soplex not found: --soplex will not work.'])

dnl Find the GNU Multiple Precision Arithmetic Library
AC_ARG_WITH(gmp,
  [AS_HELP_STRING([--with-gmp=<path>],
     	          [prefix of GMP installation. e.g. /usr/local or /usr])],
  [GMP_PREFIX="$with_gmp"],
  [AC_CHECK_LIB([gmp], [__gmpz_init], ,
    AC_MSG_ERROR([GNU Multiple Precision Arithmetic Library not found.
    Maybe you want to call configure with the --with-gmp=<path> option?
    This tells configure where to find the GMP library and headers.
    e.g. --with-gmp=/usr/local or --with-gmp=/usr]))]
)
if test "x$GMP_PREFIX" != x ; then
  GMP_LIBS=" -L${GMP_PREFIX}/lib"
  GMP_CFLAGS=" -I${GMP_PREFIX}/include"
else
  GMP_LIBS=""
  GMP_CFLAGS=""
fi
GMP_LIBS="${GMP_LIBS} -lgmp -lgmpxx"
AC_SUBST(GMP_LIBS)
AC_SUBST(GMP_CFLAGS)


# Cddlib library
LB_CHECK_CDDLIB
if test "x$cddlib_found" = "xno" ; then
    # Older versions of cddlib are compiled with the C compiler;
    # also some people compile newer versions with the C compiler instead of the C++ compiler.
    AC_LANG(C)
    LB_CHECK_CDDLIB
    if test "x$cddlib_found" = "xyes" ; then
        AC_DEFINE(HAVE_CDDLIB_C_LINKAGE, 1, [Define if the cddlib library has C linkage])
    fi
    AC_LANG(C++)
fi
if test "x$cddlib_found" = "xno" ; then
    AC_MSG_ERROR([The cddlib headers and library are required for topcom.])
fi
AC_CACHE_SAVE



dnl ===== End checks for libraries ================


dnl Finishing it up
AC_CONFIG_FILES([
  lib-src/Makefile
  lib-src-reg/Makefile
  src/Makefile
  src-reg/Makefile
  examples/Makefile
  wrap-gmp-gmpxx/Makefile
  Makefile
])
AC_OUTPUT
