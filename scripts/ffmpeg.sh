#!/bin/bash
set -e
set -x
export LD_LIBRARY_PATH=/opt/usr/lib:/opt/usr/library:/opt/usr/lib/x86_64-linux-gnu:/usr/lib:/usr/lib64
export PKG_CONFIG="pkg-config --static"
export CPATH=/opt/usr/include:/opt/usr/include/corvusoft:/opt/usr/include/boost/system:/opt/usr/include/boost:/usr/include
export LDFLAGS="-L/opt/usr/library -L/opt/usr/lib $LDFLAGS"
export CFLAGS="-I/opt/usr/include $CFLAGS"
function error_exit
{
	echo "$1" 1>&2
	exit 1
}

git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg

export CPLUS_INCLUDE_PATH=/opt/usr/include:/usr/include:$CPLUS_INCLUDE_PATH
if cd ffmpeg; then
	 ./configure --prefix="/opt/usr" --disable-doc --disable-ffserver --enable-gpl --enable-version3 --enable-shared --disable-static --enable-debug --enable-pthreads --enable-runtime-cpudetect --enable-frei0r --enable-avfilter \
	 --enable-libvpx --enable-libx264 --enable-libx265 && \
	  make -j4 && make install
		ls /opt/usr/include/
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
