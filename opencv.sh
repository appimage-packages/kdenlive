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
EXTERNAL_CMAKE_OPTIONS="-DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -DBUILD_opencv_aruco=OFF -DBUILD_opencv_bgsegm=OFF \
-DBUILD_opencv_bioinspired=OFF -DBUILD_opencv_ccalib=OFF -DBUILD_opencv_cnn_3dobj=OFF -DBUILD_opencv_cvv=OFF -DBUILD_opencv_dnn=OFF \
-DBUILD_opencv_dnns_easily_fooled=OFF -DBUILD_opencv_dpm=OFF -DBUILD_opencv_fuzzy=OFF -DBUILD_opencv_hdf=OFF -DBUILD_opencv_line_descriptor=OFF \
-DBUILD_opencv_matlab=OFF -DBUILD_opencv_optflow=OFF -DBUILD_opencv_plot=OFF -DBUILD_opencv_reg=OFF -DBUILD_opencv_rgbd=OFF \
-DBUILD_opencv_saliency=OFF -DBUILD_opencv_sfm=OFF -DBUILD_opencv_stereo=OFF -DBUILD_opencv_structured_light=OFF -DBUILD_opencv_surface_matching=OFF \
-DBUILD_opencv_xfeatures2d=OFF -DBUILD_opencv_xobjdetect=OFF -DBUILD_opencv_xphoto=OFF -DBUILD_opencv_calib3d=OFF -DBUILD_opencv_cudaarithm=OFF \
-DBUILD_opencv_cudabgsegm=OFF -DBUILD_opencv_cudacodec=OFF -DBUILD_opencv_cudafilters=OFF -DBUILD_opencv_cudalegacy=OFF -DBUILD_opencv_cudaobjdetect=OFF \
-DBUILD_opencv_cudaoptflow=OFF -DBUILD_opencv_cudastereo=OFF -DBUILD_opencv_cudawarping=OFF -DBUILD_opencv_cudev=OFF -DBUILD_opencv_java=OFF \
-DBUILD_opencv_shape=OFF -DBUILD_opencv_stitching=OFF -DBUILD_opencv_superres=OFF -DBUILD_opencv_ts=OFF -DBUILD_opencv_videoio=OFF \
-DBUILD_opencv_videostab=OFF -DBUILD_opencv_viz=OFF"

# create build dir
SRC=/app/src/opencv
PREFIX=/opt/usr/
mkdir -p $SRC/build

# go there
cd $SRC/build

if cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX $EXTERNAL_CMAKE_OPTIONS $SRC/opencv

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
