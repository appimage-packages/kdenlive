#!/bin/bash
set -e
set -x

function error_exit
{
	echo "$1" 1>&2
	exit 1
}


if wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2; then
	tar xjvf ffmpeg-snapshot.tar.bz2
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi

if cd ffmpeg; then
	 ./configure --prefix="/opt/usr" --extra-ldflags="-L/opt/usr//lib -lstdc++ -lm -lrt -ldl" --extra-cflags="-I/opt/usr/include" --pkg-config-flags="--static" --enable-shared --enable-avfilter \
	 --enable-gpl --enable-avresample --enable-libx265 --enable-libvpx --enable-libx264 --disable-doc && \
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
