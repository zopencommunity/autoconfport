#!/bin/sh

cd basic

if ! [ -x /usr/local/bin/aclocal ]; then
	echo "Have to 'make install' automake before running test" >&2
	exit 4
fi

autoreconf -d --verbose --install --force
exit 0
