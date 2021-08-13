#!/bin/sh
#set -x

if ! [ -f ./setenv.sh ]; then
	echo "Need to source from the setenv.sh directory" >&2
else
	export _BPXK_AUTOCVT="ON"
	export _CEE_RUNOPTS="FILETAG(AUTOCVT,AUTOTAG),POSIX(ON),TERMTHDACT(MSG)"
	export _TAG_REDIR_ERR="txt"
	export _TAG_REDIR_IN="txt"
	export _TAG_REDIR_OUT="txt"

	export AUTOCONF_VRM="autoconf-2.71"
	export AUTOCONF_ROOT="${PWD}"

	# 
	# Add 'm4' to PATH
	#
	export PATH=/usr/local/bin:$PATH 

	#
	# Add 'Perl' to PATH, LIBPATH, PERL5LIB
	#
 	export PERL5LIB=$PERL5LIB:/usr/local/lib/perl5
 	export LIBPATH=$LIBPATH:/usr/local/lib/perl5/5.24.0/os390/CORE
fi
