#!/bin/bash
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
 ./configure \
  --prefix="/opt/usr" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I/opt/usr/include" \
  --extra-ldflags="-L/opt/usr/lib" \
  --bindir="/opt/usr/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
make
make install
hash -r
