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
# reinstalação cmake
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
git clone https://github.com/catchorg/Catch2.git
cd Catch2
mkdir build
cmake -Bbuild -H. -DBUILD_TESTING=OFF
cmake --build build --target install
