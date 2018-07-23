cd Thirdparty/opencv-3.1.0/
mkdir build
cd build
cmake ..
make -j6
sudo make install

#如果失败使用cmake-gui 在 
#Where is thr source code :: /home/poiwu/SLAM/stereo_imu/Thirdparty/opencv-3.1.0
#Where to build the binaries :: /home/poiwu/SLAM/stereo_imu/Thirdparty/opencv-3.1.0/build
#Configure -> generate 
#使用sudo make install 完成安装opencv.
#执行 ./generate
