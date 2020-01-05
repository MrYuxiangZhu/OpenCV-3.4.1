#!/bin/bash
chmod 777 -R ./*
cp -rf downloads opencv-3.4.1/build
chmod 777 opencv-3.4.1/build
cd opencv-3.4.1/build
rm -rf CMakeFiles cmake_install.cmake cmake_uninstall.cmake CMakeCache.txt CMakeDownloadLog.txt CMakeVars.txt
chmod 777 -R ./*
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_C_EXAMPLE=OFF -D INSTALL_PYTHON_EXAMPLE=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.1/modules -D BUILD_EXAMPLES=ON ..
make
make install

sh -c 'echo "include /usr/local/lib/">>/etc/ld.so.conf'
sh -c 'echo "/usr/local/lib/" > /etc/ld.so.conf.d/opencv.conf'
ldconfig
sh -c 'echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" >>/etc/bash.bashrc'
sh -c 'echo "export PKG_CONFIG_PATH" >>/etc/bash.bashrc'
source /etc/bash.bashrc
