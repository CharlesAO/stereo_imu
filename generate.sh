cd Thirdparty/DBoW2/
mkdir build
cd build
#cmake .. -DCMAKE_BUILD_TYPE=Release -DOPenCV_DIR=/usr/local/share/OpenCV/
cmake .. -DCMAKE_BUILD_TYPE=Release -DOPenCV_DIR=/Thirdparty/opencv-3.1.0

cd ../../g2o
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j6

cd ../../fast
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DOPenCV_DIR=/Thirdparty/opencv-3.1.0
make -j6

cd ../../..
mkdir build
cd build
cmake ..
make -j6
