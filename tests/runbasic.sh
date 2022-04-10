#!/bin/sh

cd basic || exit 99
export PATH="${AUTOCONF_PROD}/bin:$PATH"

if ! whence autoreconf ; then
	echo "Have to 'make install' before running test" >&2
	exit 4
fi

autoreconf -d --verbose --install --force
exit 0
