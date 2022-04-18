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
	
        export PATH="${AUTOCONF_ROOT}/bin:$PATH"

	export AUTOTOOLS_MIRROR="https://github.com/autotools-mirror"
	export AUTOCONF_URL="http://ftp.gnu.org/gnu/autoconf/"

	#
	# Add 'Perl' and 'M4' to PATH, LIBPATH, PERL5LIB
	#
	fsroot=$( basename $HOME )                         
	export PERL_ROOT="/${fsroot}/perlprod"
	export M4_ROOT="/${fsroot}/m4prod"
	export AUTOMAKE_ROOT="/${fsroot}/automakeprod"
	export PERLLIB=$( cd ${PERL_ROOT}/lib/perl5/*/os390/CORE; echo $PWD )
	export LIBPATH="${PERLLIB}:${LIBPATH}"
	export PATH="${M4_ROOT}/bin:${PERL_ROOT}/bin:${AUTOMAKE_ROOT}/bin:$PATH"

	export AUTOCONF_PROD="/${fsroot}/autoconfprod"     
fi
