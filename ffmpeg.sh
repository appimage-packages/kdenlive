#!/bin/bash
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
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
  --enable-libfaac \
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
  --enable-libvpx
make -j4
make install
hash -r
