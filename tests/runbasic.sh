#!/bin/sh

cd basic || exit 99
export PATH="${AUTOCONF_PROD}/bin:$PATH"
rm -rf aclocal.m4 configure autom4te.cache build-aux Makefile.in hello hello.dbg hello.o config.log config.status Makefile

if ! whence autoreconf ; then
	echo "Have to 'make install' before running test" >&2
	exit 4
fi

if ! autoreconf -d --verbose --install --force ; then
	echo "autoreconf did not run correctly" >&2
	exit 4
fi

if ! ./configure ; then
	echo "configure with dependency tracking disabled did not run correctly" >&2
	exit 4
fi

if ! make ; then
	echo "unable to make helloworld program" >&2
	exit 4
fi

if ! ./hello ; then
	echo "unable to run helloworld" >&2
	exit 4
fi

exit 0
