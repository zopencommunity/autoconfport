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


	unset GIT_URL
	unset TARBALL_URL
	gitsource=false
	if $gitsource ; then
		export GIT_URL="https://github.com/autotools-mirror"
        else
		export TARBALL_URL="http://ftp.gnu.org/gnu/autoconf/"
	fi

	#
	# Add 'make', 'zlib', 'Perl', 'M4' to PATH, LIBPATH, PERL5LIB
	#
    	if [ "${GIT_ROOT}x" = "x" ]; then
	        export GIT_ROOT="${HOME}/zot/boot/git"
	fi
	if [ "${CURL_ROOT}x" = "x" ]; then
	        export CURL_ROOT="${HOME}/zot/boot/curl"
	fi
	if [ "${PERL_ROOT}x" = "x" ]; then
	        export PERL_ROOT="${HOME}/zot/prod/perl"
        fi
        if [ "${M4_ROOT}x" = "x" ]; then
 		export M4_ROOT="${HOME}/zot/prod/m4"
        fi
    	if [ "${MAKE_ROOT}x" = "x" ]; then
	        export MAKE_ROOT="${HOME}/zot/prod/make"
	fi
        if [ "${GZIP_ROOT}x" = "x" ]; then
 		export GZIP_ROOT="${HOME}/zot/boot/gzip"
 	fi
        if [ "${ZLIB_ROOT}x" = "x" ]; then
 		export ZLIB_ROOT="${HOME}/zot/boot/zlib"
 	fi
        if [ "${AUTOCONF_INSTALL_PREFIX}x" = "x" ]; then
 		export AUTOCONF_INSTALL_PREFIX="${HOME}/zot/prod/autoconf"
        fi
	
	export MY_ROOT="${PWD}"
	export PATH="${M4_ROOT}/bin:${PERL_ROOT}/bin:${GIT_ROOT}/bin:${MAKE_ROOT}/bin:${CURL_ROOT}/bin:${GZIP_ROOT}/bin:${ZLIB_ROOT}/bin:$PATH"

        for libperl in $(find "${PERL_ROOT}" -name "libperl.so"); do
        	lib=$(dirname "${libperl}")
		export LIBPATH="${lib}:${LIBPATH}"
		break
        done
	export PERL5LIB_ROOT=$( cd ${PERL_ROOT}/lib/perl5/5*; echo $PWD )
        export PERL5LIB="${PERL5LIB_ROOT}:${PERL5LIB_ROOT}/os390"

	export AUTOCONF_PROD="${HOME}/zot/prod/autoconf"
fi
