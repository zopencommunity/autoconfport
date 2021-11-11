#!/bin/sh
#
# When this is run, it spits out an error:
# ERROR: end of file in comment
#
echo 'm4_define([m4_require_silent_probe], [-])' | \
  /usr/local/bin/autom4te -v --language Autoconf-without-aclocal-m4  \
  - /usr/local/share/aclocal-1.16/internal/ac-config-macro-dirs.m4 \
  '/usr/local/share/aclocal-1.16/amversion.m4' '/usr/local/share/aclocal-1.16/auxdir.m4' \
  '/usr/local/share/aclocal-1.16/cond.m4' '/usr/local/share/aclocal-1.16/depend.m4' \
  '/usr/local/share/aclocal-1.16/depout.m4' '/usr/local/share/aclocal-1.16/init.m4' \
  '/usr/local/share/aclocal-1.16/install-sh.m4' '/usr/local/share/aclocal-1.16/lead-dot.m4' \
  '/usr/local/share/aclocal-1.16/make.m4' '/usr/local/share/aclocal-1.16/missing.m4' \
  '/usr/local/share/aclocal-1.16/options.m4' '/usr/local/share/aclocal-1.16/prog-cc-c-o.m4' \
  '/usr/local/share/aclocal-1.16/runlog.m4' '/usr/local/share/aclocal-1.16/sanity.m4' \
  '/usr/local/share/aclocal-1.16/silent.m4' '/usr/local/share/aclocal-1.16/strip.m4' \
  '/usr/local/share/aclocal-1.16/substnot.m4' '/usr/local/share/aclocal-1.16/tar.m4' \
  --trace='AC_DEFUN:$f::$n::${::}%' --trace='AC_DEFUN_ONCE:$f::$n::${::}%' \
  --trace='AU_DEFUN:$f::$n::${::}%' --trace='_AM_AUTOCONF_VERSION:$f::$n::${::}%' \
  --trace='AC_CONFIG_MACRO_DIR_TRACE:$f::$n::${::}%' --trace='AC_CONFIG_MACRO_DIR:$f::$n::${::}%' \
  --trace='_AM_CONFIG_MACRO_DIRS:$f::$n::${::}%' --trace='AM_PROG_INSTALL_STRIP:$f::$n' \
  --trace='_AC_AM_CONFIG_HEADER_HOOK:$f::$n' --trace='AM_MISSING_PROG:$f::$n' \
  --trace='AM_MAKE_INCLUDE:$f::$n' --trace='_AM_SET_OPTION:$f::$n' --trace='AM_SET_LEADING_DOT:$f::$n' \
  --trace='_AM_MANGLE_OPTION:$f::$n' --trace='AM_OUTPUT_DEPENDENCY_COMMANDS:$f::$n' \
  --trace='AM_SUBST_NOTMAKE:$f::$n' --trace='AM_SILENT_RULES:$f::$n' \
  --trace='AM_CONDITIONAL:$f::$n' --trace='_AM_PROG_CC_C_O:$f::$n' \
  --trace='AM_SANITY_CHECK:$f::$n' --trace='_AM_DEPENDENCIES:$f::$n' \
  --trace='_AM_SET_OPTIONS:$f::$n' --trace='AM_PROG_INSTALL_SH:$f::$n' \
  --trace='AM_SET_CURRENT_AUTOMAKE_VERSION:$f::$n' \
  --trace='_AM_SUBST_NOTMAKE:$f::$n' \
  --trace='_AM_IF_OPTION:$f::$n' \
  --trace='AM_SET_DEPDIR:$f::$n' \
  --trace='_AM_OUTPUT_DEPENDENCY_COMMANDS:$f::$n' \
  --trace='AM_RUN_LOG:$f::$n' --trace='AM_AUX_DIR_EXPAND:$f::$n' \
  --trace='AM_DEP_TRACK:$f::$n' --trace='_AM_PROG_TAR:$f::$n' \
  --trace='AM_INIT_AUTOMAKE:$f::$n' --trace='AM_MISSING_HAS_RUN:$f::$n' \
  --trace='AM_PROG_CC_C_O:$f::$n' --trace='AM_AUTOMAKE_VERSION:$f::$n' firstbug.ac
