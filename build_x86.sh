#!/bin/bash
chmod 777 -R ./*
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install libgtk2.0-dev
sudo apt-get -y install build-essential cmake cmake-qt-gui git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python python3 python-pip python3-pip python-opencv python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev liblapacke-dev libxvidcore-dev libx264-dev libatlas-base-dev gfortran gtk+-3.0  libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libtiff5-dev libjasper1 libavresample-dev libgphoto2-dev libopenblas-dev doxygen
#apt-get install yasm ffmpeg
sudo apt-get -y install libgphoto2-dev libv4l-dev*

cd opencv-3.4.1
mkdir build
chmod 777 build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_C_EXAMPLE=OFF -D INSTALL_PYTHON_EXAMPLE=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.1/modules -D BUILD_EXAMPLES=ON ..
make
make install

sudo sh -c 'echo "include /usr/local/lib/">>/etc/ld.so.conf'
sudo sh -c 'echo "/usr/local/lib/" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
sudo sh -c 'echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" >>/etc/bash.bashrc'
sudo sh -c 'echo "export PKG_CONFIG_PATH" >>/etc/bash.bashrc'
source /etc/bash.bashrc