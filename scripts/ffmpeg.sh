#!/bin/bash
set -e
set -x

function error_exit
{
	echo "$1" 1>&2
	exit 1
}
mv /opt/usr/./include/frei0r.h /opt/usr/include/

if wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2; then
	tar xjvf ffmpeg-snapshot.tar.bz2
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi

if cd ffmpeg; then
	 ./configure --prefix="/opt/usr" --extra-ldflags="-L/opt/usr//lib -lstdc++ -lm -lrt -ldl" --extra-cflags="-I/opt/usr/include" --pkg-config-flags="--static" --progs-suffix=mlt --build-suffix=mlt --enable-shared --enable-libmp3lame --enable-gpl --enable-libvorbis --enable-pthreads --enable-libxvid --enable-x11grab --enable-libgsm \
 	 --enable-libx264 --enable-libtheora --enable-libdc1394 --enable-nonfree --disable-stripping --enable-avfilter --enable-libschroedinger --enable-libopencore-amrnb --enable-libopencore-amrwb \
 	 --enable-version3 --enable-libvpx && \
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
