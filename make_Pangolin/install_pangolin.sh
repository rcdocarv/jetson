#!/bin/bash

pip install pybind11
pip install PyOpenGL PyOpenGL_accelerate
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
cmake -Dpybind11_DIR=/path/to/pybind11/share/cmake/pybind11 .. #cmake ..
make -j4 # make

# Instalar Pangolin
sudo make install

# Voltar ao diretório inicial
cd ../..

# Mensagem de conclusão
echo "Pangolin foi instalado com sucesso no Ubuntu 18.04 com Python 3.8 na Jetson Nano."
