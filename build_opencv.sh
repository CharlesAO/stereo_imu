cd Thirdparty/opencv-3.1.0/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/Thirdparty/opencv-3.1.0
make -j6
sudo make install

#如果失败使用cmake-gui 在 opencv-3.1.0调整完
#使用sudo make install 先build完opencv.
