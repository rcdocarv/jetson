#!/bin/bash
pip install "pybind11[global]"
#pip install pybind11
python -m pybind11 --cmake-dir

sudo apt-get install python3-distutils

# Atualizar e instalar dependências
sudo apt-get update
sudo apt-get install -y build-essential cmake libglew-dev libpython3.8-dev python3.8-venv

# Clonar o repositório Pangolin
git clone https://github.com/uoip/pangolin.git
cd pangolin

# Criar e ativar um ambiente virtual Python 3.8
python3.8 -m venv pangolin_env
source pangolin_env/bin/activate

# Instalar dependências Python
pip install numpy

# Criar diretório de build e compilar Pangolin
mkdir build
cd build
cmake -Dpybind11_DIR=$(python -m pybind11 --cmake-dir) ..
make -j8
cd ..
# Editar o setup.py Substitua todas as instâncias de install_dirs por install_dir. Isso deve corrigir o erro
sudo python3 setup.py install 
# testar no python 
## python3
## import pangolin
# Eventualmente o pangolin nao terá versão 
python3 -c "import pangolin; print(pangolin.__file__)" # comando irá dizer onde esta o modulo
cd <caminho do comando anterior>
sudo mkdir pangolin
sudo mv pangolin.cpython-36m-aarch64-linux-gnu.so pangolin/
cd pangolin
echo "__version__ = '1.0.0'" | sudo tee /usr/local/lib/python3.8/dist-packages/pangolin/__init__.py
# Introduzir __version__ = '1.0.0'  # Substitua '1.0.0' pela versão correta
python3.8
import pangolin
print(pangolin.__version__)
python3 -m pip list
python3.8 -m pip install --upgrade PyOpenGL_accelerate
python3.8 -m pip install --upgrade numpy
pip uninstall numpy
pip install protobuf
pip install numpy --user
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
sudo update-alternatives --config python
python3.8 -m pip install numpy

# -----------------------------------------------------------------------------
# reinstalação/compilação cmake
cd ~
wget https://github.com/Kitware/CMake/releases/download/v4.0.0-rc4/cmake-4.0.0-rc4-linux-aarch64.sh
chmod +x cmake-4.0.0-rc4-linux-aarch64.sh
sudo mkdir /opt/cmake
./cmake-4.0.0-rc4-linux-aarch64.sh
#./cmake-4.0.0-rc4-linux-aarch64.sh --prefix=/opt/cmake --skip-license
cd ~/cmake-4.0.0-rc4-linux-aarch64
sudo cp -r * /opt/cmake/
cd ..
rm -rf cmake-4.0.0-rc4-linux-aarch64.sh
rm -rf cmake-4.0.0-rc4-linux-aarch64/
#echo 'export PATH=/opt/cmake/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
cmake --version

# Install Catch2
cd ~
git clone https://github.com/catchorg/Catch2.git
cd ~/Catch2
cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr/local
cmake --build build --target install
cmake ..
make
sudo make install 
#cmake -Bbuild -H. -DBUILD_TESTING=OFF
#cmake --build build
#export PATH=$PATH:/opt/cmake/bin/cmake
#sudo cmake --build build --target install
#ls /usr/local/lib | grep Catch2


# Install Pangolin 
python3.8 -m pip install  PyOpenGL_accelerate
python3.8 -m pip install PyOpenGL 
git clone https://github.com/uoip/pangolin.git
cd pangolin
mkdir build
cd build
#cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
#cmake -B build  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DPYTHON_EXECUTABLE=$(which python3) -DPYTHON_INCLUDE_DIR=$(python3 -c 'from distutils.sysconfig import get_python_inc; print(get_python_inc())') -DPYTHON_LIBRARY=$(python3 -c 'import sysconfig; print(sysconfig.get_config_var("LIBDIR"))') ..
#cmake --build build
#cmake --build build -t pypangolin_pip_install
cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DPYTHON_EXECUTABLE=$(which python3.8) ..
make -j$(nproc)
make -j8
cd ..
sudo make install
make install
sudo python3.8 setup.py install # este comando tem de instalar o pangolin mas tem de baixar o setup.py deste repositorio 

# instalar o g2o
# https://vox-nav.readthedocs.io/en/latest/openvslam/index.html
sudo apt install gcc-9 g++-9
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100
sudo apt install libeigen3-dev libboost-all-dev libsuitesparse-dev
cd ~
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o
mkdir build
cd build
# cmake .. -DCMAKE_BUILD_TYPE=Release
cmake \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr/local \
   -DCMAKE_CXX_FLAGS=-std=c++11 \
   -DBUILD_SHARED_LIBS=ON \
   -DBUILD_UNITTESTS=OFF \
   -DBUILD_WITH_MARCH_NATIVE=OFF \
   -DG2O_USE_CHOLMOD=OFF \
   -DG2O_USE_CSPARSE=ON \
   -DG2O_USE_OPENGL=OFF \
   -DG2O_USE_OPENMP=ON \
   -DCMAKE_CXX_STANDARD=17 \
   -DCMAKE_EXE_LINKER_FLAGS="-lstdc++fs" \
   ..
make -j$(nproc)
sudo make install

# OpenVslam
# https://vox-nav.readthedocs.io/en/latest/openvslam/index.html
sudo apt install libyaml-cpp-dev
git clone --recursive https://github.com/OpenVSLAM-Community/openvslam.git
cd openvslam
mkdir build && cd build
cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DPYTHON_EXECUTABLE=$(which python3.8) -DBUILD_PYTHON_BINDINGS=ON ..
sudo apt install sqlite3 libsqlite3-dev
sudo apt install libg2o-dev
