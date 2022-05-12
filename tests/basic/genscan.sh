#!/bin/sh
export PATH=$HOME/zot/prod/autoconf/bin:$PATH
. $HOME/zot/prod/perl/.env
export CC=xlclang
export CXX=xlclang++
mydir=$( cd $( dirname $0 ); echo $PWD )
${mydir}/cleanup.sh

cat <<zz >hw.c
#include "config.h"
#include <stdio.h>
#ifdef HAVE_SYS_TIME_H
#include <sys/time.h>
#else
#include <time.h>
#endif
#ifdef HAVE_C_BACKSLASH_A
	#define STR "\a Hello \a"
#else
	#error "Should have backslash a"
#endif
int main() { 
  printf(STR); 
  return 0; 
}
zz

autoscan
cat configure.scan | awk '/AC_PROG_CC/ { print; print "AC_C_BACKSLASH_A"; next } // { print }' >configure.ac
autoheader
autoconf
./configure

cc -ohw hw.c
./hw
