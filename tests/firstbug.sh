#!/bin/sh
#
# When this is run, it spits out an error:
# ERROR: end of file in comment
#
export AUTOM4TE="/${fsroot}/autoconfprod/bin/autom4te"
export AUTOMAKE_SHARE="/${fsroot}/automakeprod/share/aclocal-1.16"
echo 'm4_define([m4_require_silent_probe], [-])' | \
  ${AUTOM4TE} -v --language Autoconf-without-aclocal-m4  \
  - ${AUTOMAKE_SHARE}/internal/ac-config-macro-dirs.m4 \
  ${AUTOMAKE_SHARE}/amversion.m4 ${AUTOMAKE_SHARE}/auxdir.m4 \
  ${AUTOMAKE_SHARE}/cond.m4 ${AUTOMAKE_SHARE}/depend.m4 \
  ${AUTOMAKE_SHARE}/depout.m4 ${AUTOMAKE_SHARE}/init.m4 \
  ${AUTOMAKE_SHARE}/install-sh.m4 ${AUTOMAKE_SHARE}/lead-dot.m4 \
  ${AUTOMAKE_SHARE}/make.m4 ${AUTOMAKE_SHARE}/missing.m4 \
  ${AUTOMAKE_SHARE}/options.m4 ${AUTOMAKE_SHARE}/prog-cc-c-o.m4 \
  ${AUTOMAKE_SHARE}/runlog.m4 ${AUTOMAKE_SHARE}/sanity.m4 \
  ${AUTOMAKE_SHARE}/silent.m4 ${AUTOMAKE_SHARE}/strip.m4 \
  ${AUTOMAKE_SHARE}/substnot.m4 ${AUTOMAKE_SHARE}/tar.m4 \
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
