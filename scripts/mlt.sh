#!/bin/bash

export CFLAGS="-I/opt/usr/include $CFLAGS"

set -e
set -x

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

if cd /app/src/mlt; then
	'./configure --enable-gpl --enable-gpl3 --disable-rtaudio --prefix=/usr && make V=1 && make install'
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
