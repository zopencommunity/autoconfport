#!/bin/sh
export PATH=$HOME/zot/prod/autoconf/bin:$PATH
. $HOME/zot/prod/perl/.env
export CC=xlclang
export CXX=xlclang++

mydir=$( cd $( dirname $0 ); echo $PWD )
${mydir}/cleanup.sh

autoheader
autoconf
./configure
