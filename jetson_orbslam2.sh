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
################################################################################
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
################################################################33
make -j$(nproc)

cd ../../g2o
mkdir build && cd build
cmake ..
make -j$(nproc)
$$$$$$%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INSTALAR PANGOLIN %%%%%%%%%%%%%%%%%%%%%%%555
sudo apt-get install -y libglew-dev
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
git checkout v0.5  # Este é um commit mais antigo que deve ser compatível
mkdir build
cd build
cmake ..
make -j4
sudo make install

Configure o CMake para encontrar o Pangolin: Adicione o caminho do Pangolin ao CMAKE_PREFIX_PATH ou defina a variável Pangolin_DIR no terminal:
export Pangolin_DIR=/usr/local/lib/cmake/Pangolin

Atualize o CMakeLists.txt do ORB_SLAM2: Certifique-se de que o CMakeLists.txt do ORB_SLAM2 está configurado para encontrar o Pangolin:
find_package(Pangolin REQUIRED)
Depois de seguir esses passos, tente novamente os seguintes comandos no diretório do ORB_SLAM2:

cd ~/ORB_SLAM2/build
rm -rf CMakeFiles CMakeCache.txt
cmake .. -DOpenCV_DIR=/usr/lib/aarch64-linux-gnu/cmake/opencv4 -DCMAKE_CXX_STANDARD=11 -DPangolin_DIR=/usr/local/lib/cmake/Pangolin
make
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../../../
mkdir build && cd build
# alterar o CMAKElist.txt em /home/star/ORB_SLAM2
################################################################################
cmake_minimum_required(VERSION 2.8)
project(ORB_SLAM2)

IF(NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE Release)
ENDIF()

MESSAGE("Build type: " ${CMAKE_BUILD_TYPE})

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -Wall  -O3 -march=native ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall   -O3 -march=native")

# Check C++11 or C++0x support
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
   add_definitions(-DCOMPILEDWITHC11)
   message(STATUS "Using flag -std=c++11.")
elseif(COMPILER_SUPPORTS_CXX0X)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
   add_definitions(-DCOMPILEDWITHC0X)
   message(STATUS "Using flag -std=c++0x.")
else()
   message(FATAL_ERROR "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(OpenCV 4.1.1 QUIET)
if(NOT OpenCV_FOUND)
   find_package(OpenCV 3.0 QUIET)
   if(NOT OpenCV_FOUND)
      find_package(OpenCV 2.4.3 QUIET)
      if(NOT   endif()
endif()

find_package(Eigen3 3.1.0 REQUIRED)
find_package(Pangolin REQUIRED)

include_directories(
${PROJECT_SOURCE_DIR}
${PROJECT_SOURCE_DIR}/include
${EIGEN3_INCLUDE_DIR}
${Pangolin_INCLUDE_DIRS}
)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)

add_library(${PROJECT_NAME} SHARED
src/System.cc
src/Tracking.cc
src/LocalMapping.cc
src/LoopClosing.cc
src/ORBextractor.cc
src/ORBmatcher.cc
src/FrameDrawer.cc
src/Converter.cc
src/MapPoint.cc
src/KeyFrame.cc
src/Map.cc
src/MapDrawer.cc
src/Optimizer.cc
src/PnPsolver.cc
src/Frame.cc
src/KeyFrameDatabase.cc
src/Sim3Solver.cc
src/Initializer.cc
src/Viewer.cc
)

target_link_libraries(${PROJECT_NAME}
${OpenCV_LIBS}
${EIGEN3_LIBS}
${Pangolin_LIBRARIES}
${PROJECT_SOURCE_DIR}/Thirdparty/DBoW2/lib/libDBoW2.so
${PROJECT_SOURCE_DIR}/Thirdparty/g2o/lib/libg2o.so
)

# Build examples

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/RGB-D)

add_executable(rgbd_tum
Examples/RGB-D/rgbd_tum.cc)
target_link_libraries(rgbd_tum ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Stereo)

add_executable(stereo_kitti
Examples/Stereo/stereo_kitti.cc)
target_link_libraries(stereo_kitti ${PROJECT_NAME})

add_executable(stereo_euroc
Examples/Stereo/stereo_euroc.cc)
target_link_libraries(stereo_euroc ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Monocular)

add_executable(mono_tum
Examples/Monocular/mono_tum.cc)
target_link_libraries(mono_tum ${PROJECT_NAME})

add_executable(mono_kitti
Examples/Monocular/mono_kitti.cc)
target_link_libraries(mono_kitti ${PROJECT_NAME})

add_executable(mono_euroc
Examples/Monocular/mono_euroc.cc)
target_link_libraries(mono_euroc ${PROJECT_NAME})
################################################################################
#cmake ..
#make -j$(nproc)
rm -rf CMakeFiles CMakeCache.txt
cmake .. -DOpenCV_DIR=/usr/lib/aarch64-linux-gnu/cmake/opencv4 -DCMAKE_CXX_STANDARD=11 -DPangolin_DIR=/usr/local/lib/cmake/Pangolin
# editar os ficheiro /home/star/ORB_SLAM2/INclude/Orb_extrator
# trocar #Include <opencv/cv.h> por #include <opencv2/opencv.hpp>
nano ~/ORB_SLAM2/src/System.cc
# adicionar #include <unistd.h>
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCvMat\b/cv::Mat/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCV_RGB2GRAY\b/cv::COLOR_RGB2GRAY/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCV_BGR2GRAY\b/cv::COLOR_BGR2GRAY/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCV_RGBA2GRAY\b/cv::COLOR_RGBA2GRAY/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCV_BGRA2GRAY\b/cv::COLOR_BGRA2GRAY/g' {} +
# editar e acrescentar "#include <unistd.h>"  nano ~/ORB_SLAM2/src/Tracking.cc
# nano ~/ORB_SLAM2/src/LocalMapping.cc - #include <unistd.h>
# nano ~/ORB_SLAM2/src/LoopClosing.h   - #include <unistd.h>
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCV_GRAY2BGR\b/cv::COLOR_GRAY2BGR/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bcvCreateMat\b/new cv::Mat/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bcvMat\b/cv::Mat/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bcvMulTransposed\b/cv::mulTransposed/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCV_SVD_MODIFY_A\b/cv::SVD::MODIFY_A/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bCV_SVD_U_T\b/cv::SVD::FULL_UV/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bcvSVD\b/cv::SVD::compute/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bcvReleaseMat\b/release/g' {} +
find ~/ORB_SLAM2/ -type f -exec sed -i 's/\bcvInvert\b/cv::invert/g' {} +
