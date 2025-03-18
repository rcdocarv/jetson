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
# alterar o CmakeLIst.cmake pelo conteudo abaixo
###
cmake_minimum_required(VERSION 2.8)
project(DBoW2)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -Wall  -O3 -march=native ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -O3 -march=native")

set(HDRS_DBOW2
  DBoW2/BowVector.h
  DBoW2/FORB.h
  DBoW2/FClass.h
  DBoW2/FeatureVector.h
  DBoW2/ScoringObject.h
  DBoW2/TemplatedVocabulary.h)
set(SRCS_DBOW2
  DBoW2/BowVector.cpp
  DBoW2/FORB.cpp
  DBoW2/FeatureVector.cpp
  DBoW2/ScoringObject.cpp)

set(HDRS_DUTILS
  DUtils/Random.h
  DUtils/Timestamp.h)
set(SRCS_DUTILS
  DUtils/Random.cpp
  DUtils/Timestamp.cpp)

find_package(OpenCV 4.1.1 QUIET)
if(NOT OpenCV_FOUND)
   find_package(OpenCV 3.0 QUIET)
   if(NOT OpenCV_FOUND)
      find_package(OpenCV 2.4.3 QUIET)
      if(NOT OpenCV_FOUND)
         message(FATAL_ERROR "OpenCV > 2.4.3 not found.")
      endif()
   endif()
endif()

set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

include_directories(${OpenCV_INCLUDE_DIRS})
add_library(DBoW2 SHARED ${SRCS_DBOW2} ${SRCS_DUTILS})
target_link_libraries(DBoW2 ${OpenCV_LIBS})
###
# cmake .. -DOpenCV_DIR=$OpenCV_DIR -DCMAKE_CXX_STANDARD=11

make -j$(nproc)

cd ../../g2o
mkdir build && cd build
cmake ..
make -j$(nproc)

cd ../../../
mkdir build && cd build
cmake ..
make -j$(nproc)
