#!/bin/bash
set -x
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2

if cd ffmpeg \
 ./configure \
  --prefix="/opt/usr" \
  --progs-suffix=mlt \
  --build-suffix=mlt \
  --enable-shared \
  --enable-libmp3lame \
  --enable-gpl \
  --enable-libfaac \
  --enable-libvorbis \
  --enable-pthreads \
  --enable-libxvid \
  --enable-x11grab \
  --enable-libgsm \
  --enable-libx264 \
  --enable-libtheora \
  --enable-libdc1394 \
  --enable-nonfree \
  --disable-stripping \
  --enable-avfilter \
  --enable-libschroedinger \
  --enable-libopencore-amrnb \
  --enable-libopencore-amrwb \
  --enable-version3 \
  --enable-libvpx; then
	make -j4
  make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi

function error_exit
{
	echo "$1" 1>&2
	exit 1
}
