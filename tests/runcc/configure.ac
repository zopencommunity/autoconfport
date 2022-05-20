#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([FULL-PACKAGE-NAME], [VERSION], [BUG-REPORT-ADDRESS])
AC_CONFIG_SRCDIR([hw.c])

# Checks for programs.
AC_PROG_CC

#AC_COMPILE_IFELSE([[int main() { return 0; }]], echo 'pass', echo 'fail')
AC_RUN_IFELSE([AC_LANG_SOURCE([[int main() { return 0; }]])], echo 'pass', echo 'fail')

AC_OUTPUT
