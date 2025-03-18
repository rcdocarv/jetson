sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
df -h
sudo apt install -y cmake git g++ libopencv-dev libeigen3-dev
cd ~
git clone https://github.com/raulmur/ORB_SLAM2.git
cd ORB_SLAM2
cd Thirdparty/DBoW2
mkdir build && cd build

pkg-config --modversion opencv4 # verifica se está instalado
pkg-config --cflags --libs opencv4 # caminho da instalação
# Editar o CMakeLists.txt set(CMAKE_CXX_STANDARD 11) nao se fez
export OpenCV_DIR=/usr/lib/aarch64-linux-gnu/cmake/opencv4
cmake .. -DOpenCV_DIR=$OpenCV_DIR -DCMAKE_CXX_STANDARD=11

make -j$(nproc)

cd ../../g2o
mkdir build && cd build
cmake ..
make -j$(nproc)

cd ../../../
mkdir build && cd build
cmake ..
make -j$(nproc)
