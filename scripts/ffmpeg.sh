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
export CPLUS_INCLUDE_PATH=/opt/usr/include:/usr/include:$CPLUS_INCLUDE_PATH
if cd ffmpeg; then
	 ./configure --prefix="/usr" --disable-doc --disable-ffserver --enable-gpl --enable-version3 --enable-shared --enable-static --enable-debug --enable-pthreads --enable-runtime-cpudetect --enable-frei0r && \
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
