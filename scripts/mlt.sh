#!/bin/bash

export LD_LIBRARY_PATH=/opt/usr/lib:/opt/usr/library:/opt/usr/lib/x86_64-linux-gnu:/usr/lib:/usr/lib64
export PKG_CONFIG="pkg-config --static"
export CPATH=/opt/usr/include:/opt/usr/include/corvusoft:/opt/usr/include/boost/system:/opt/usr/include/boost:/usr/include
export LDFLAGS="-L/opt/usr/library -L/opt/usr/lib $LDFLAGS"
export CFLAGS="-I/opt/usr/include $CFLAGS"

set -e
set -x

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

git clone https://github.com/mltframework/mlt

if cd mlt; then
	ls
./configure --enable-gpl --enable-gpl3 --disable-rtaudio --prefix=/opt/usr && make V=1 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
