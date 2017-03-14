#!/bin/bash
set -e
set -x


function error_exit
{
	echo "$1" 1>&2
	exit 1
}

if wget ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2; then
	mkdir x264 && 	tar xjvf last_x264.tar.bz2 -C x264 --strip-components 1

else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
if cd x264; then
	  ./configure --enable-static --enable-shared --prefix=/opt/usr
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
