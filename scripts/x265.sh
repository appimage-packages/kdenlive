#!/bin/bash
set -e
set -x

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

if wget http://ftp.videolan.org/pub/videolan/x265/x265_2.3.tar.gz; then
	tar xvf x265_2.3.tar.gz
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi

if cd x265_2.3/build/linux; then
	  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/usr" -DENABLE_PIC=ON -DENABLE_SHARED=OFF ../../source
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
