#!/bin/bash
set -x
#opencv_contrib
cd /app/src/
if ( test -d /app/src/opencv_contrib )
then
        echo "opencv_contrib already cloned"
        cd opencv_contrib
        git reset --hard
#        git pull --rebase
        git checkout 3.2.0
        cd ..
else
       git clone https://github.com/opencv/opencv_contrib.git
fi

cd /app/src/
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.2.0

#opencv

# create build dir
SRC=/app/src/opencv
PREFIX=/usr
mkdir -p $SRC/build

# go there
cd $SRC/build

if cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX; then

# make
make -j8

# install
make install

else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi

function error_exit
{
	echo "$1" 1>&2
	exit 1
}
