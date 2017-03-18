#!/bin/bash
set -e
set -x

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg

export CPLUS_INCLUDE_PATH=/opt/usr/include:/usr/include:$CPLUS_INCLUDE_PATH
if cd ffmpeg; then
	 ./configure --prefix="/usr" --disable-doc --disable-ffserver --enable-gpl --enable-version3 --enable-shared --enable-static --enable-debug --enable-pthreads --enable-runtime-cpudetect --enable-frei0r --enable-avfilter && \
	  make -j4 && make install
		ls /usr/lib/
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
