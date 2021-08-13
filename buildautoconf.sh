#!/bin/sh 
#
# Pre-requisites: 
#  - cd to the directory of this script before running the script   
#  - ensure you have sourced setenv.sh, e.g. . ./setenv.sh
#  - ensure you have GNU make installed (4.1 or later)
#  - ensure you have Perl installed (Perl 5.006 or later)
#  - ensure you have access to c99
#  - either pre-install the AUTOCONF tar ball into AUTOCONF_ROOT or have curl/gunzip installed for auto-download
#
if [ "${AUTOCONF_ROOT}" = '' ]; then
	echo "Need to set AUTOCONF_ROOT - source setenv.sh" >&2
	exit 16
fi
if [ "${AUTOCONF_VRM}" = '' ]; then
	echo "Need to set AUTOCONF_VRM - source setenv.sh" >&2
	exit 16
fi

make --version >/dev/null 2>&1 
if [ $? -gt 0 ]; then
	echo "You need GNU Make on your PATH in order to build AUTOCONF" >&2
	exit 16
fi

perl --version >/dev/null 2>&1 
if [ $? -gt 0 ]; then
	echo "You need perl on your PATH in order to build AUTOCONF" >&2
	exit 16
fi

m4 --version >/dev/null 2>&1 
if [ $? -gt 0 ]; then
	echo "You need m4 on your PATH in order to build AUTOCONF" >&2
	exit 16
fi

whence c99 >/dev/null
if [ $? -gt 0 ]; then
	echo "c99 required to build AUTOCONF. " >&2
	exit 16
fi

MY_ROOT="${PWD}"

if [ "${AUTOCONF_VRM}" != "autoconf" ]; then
	# Non-dev - get the tar file
	rm -rf "${AUTOCONF_ROOT}/${AUTOCONF_VRM}"
	mkdir -p "${AUTOCONF_ROOT}/${AUTOCONF_VRM}"
	if [ $? -gt 0 ]; then
		echo "Unable to make root AUTOCONF directory: ${AUTOCONF_ROOT}/${AUTOCONF_VRM}" >&2
		exit 16
	fi
	cd "${AUTOCONF_ROOT}"
	AUTOCONF_ROOT="${PWD}"

	if ! [ -f "${AUTOCONF_VRM}.tar" ]; then
		URL="http://ftp.gnu.org/gnu/autoconf/"
		echo "autoconf tar file not found. Attempt to download with curl" 
		whence curl >/dev/null
		if [ $? -gt 0 ]; then
			echo "curl not installed. You will need to upload AUTOCONF, or install curl/gunzip from ${URL}" >&2
			exit 16
		fi	
		whence gunzip >/dev/null
		if [ $? -gt 0 ]; then
			echo "gunzip required to unzip AUTOCONF. You will need to upload AUTOCONF, or install curl/gunzip from ${URL}" >&2
			exit 16
		fi	
		(rm -f ${AUTOCONF_VRM}.tar.gz; curl -s --output ${AUTOCONF_VRM}.tar.gz http://ftp.gnu.org/gnu/autoconf/${AUTOCONF_VRM}.tar.gz)
		rc=$?
		if [ $rc -gt 0 ]; then
			echo "curl failed with rc $rc when trying to download ${AUTOCONF_VRM}.tar.gz" >&2
			exit 16
		fi	
		chtag -b ${AUTOCONF_VRM}.tar.gz
		gunzip ${AUTOCONF_VRM}.tar.gz
		rc=$?
		if [ $rc -gt 0 ]; then
			echo "gunzip failed with rc $rc when trying to unzip ${AUTOCONF_VRM}.tar.gz" >&2
			exit 16
		fi	
	fi

	tar -xf "${AUTOCONF_VRM}.tar"
	if [ $? -gt 0 ]; then
		echo "Unable to make untar AUTOCONF drop: ${AUTOCONF_VRM}" >&2
		exit 16
	fi
else
	cd "${AUTOCONF_ROOT}"
	AUTOCONF_ROOT="${PWD}"
fi
chtag -R -h -t -cISO8859-1 "${AUTOCONF_VRM}"
if [ $? -gt 0 ]; then
	echo "Unable to tag AUTOCONF directory tree as ASCII" >&2
	exit 16
fi

DELTA_ROOT="${PWD}"

cd "${AUTOCONF_ROOT}/${AUTOCONF_VRM}"

if [ "${AUTOCONF_VRM}" = "autoconf" ]; then
	./bootstrap
	if [ $? -gt 0 ]; then
		echo "Bootstrap of AUTOCONF dev-line failed." >&2
		exit 16
	fi
fi

#
# Setup the configuration so that the system search path looks in lib and include ahead of the standard C libraries
#
./configure CC=c99 CFLAGS="-qlanglvl=extc1x -qascii -D_OPEN_THREADS=3 -D_UNIX03_SOURCE=1 -DNSIG=39 -qnose -I${AUTOCONF_ROOT}/${AUTOCONF_VRM}/lib,${DELTA_ROOT}/include,/usr/include"
if [ $? -gt 0 ]; then
	echo "Configure of AUTOCONF tree failed." >&2
	exit 16
fi

cd "${AUTOCONF_ROOT}/${AUTOCONF_VRM}"
make
if [ $? -gt 0 ]; then
	echo "MAKE of AUTOCONF tree failed." >&2
	exit 16
fi


cd "${DELTA_ROOT}/tests"
export PATH="${AUTOCONF_ROOT}/${AUTOCONF_VRM}/src:${PATH}"

./runbasic.sh
if [ $? -gt 0 ]; then
	echo "Basic test of AUTOCONF failed." >&2
	exit 16
fi
./runexamples.sh
if [ $? -gt 0 ]; then
	echo "Example tests of AUTOCONF failed." >&2
	exit 16
fi
exit 0
