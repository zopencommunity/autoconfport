#!/bin/sh
export PATH=$HOME/zot/prod/autoconf/bin:$PATH
. $HOME/zot/prod/perl/.env
export CC=xlclang

mydir=$( cd $( dirname $0 ); echo $PWD )
${mydir}/cleanup.sh

cat <<zz >hw.c
int main() { 
  return 0; 
}
zz

autoconf --force
./configure -C
./configure -C
