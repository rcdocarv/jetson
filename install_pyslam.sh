#!/bin/bash

# Atualizar o sistema
echo "Atualizando o sistema..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar dependências do sistema necessárias para o PySlam
echo "Instalando dependências do sistema..."
sudo apt-get install -y \
    build-essential \
    cmake \
    git \
    python3-dev \
    python3-pip \
    libopencv-dev \
    libeigen3-dev \
    libboost-all-dev \
    libpng-dev \
    libjpeg8-dev \
    libtiff-dev \
    libgtk-3-dev \
    libcanberra-gtk* \
    libatlas-base-dev \
    gfortran

# Instalar o Python e as dependências Python necessárias
echo "Instalando dependências Python..."
python3 -m pip install --upgrade pip
python3 -m pip install numpy opencv-python opencv-contrib-python

# Clonar o repositório PySlam
echo "Clonando o repositório PySlam..."
git clone https://github.com/ljkeller/PySlam.git
cd PySlam

# Construir o projeto
echo "Construindo o PySlam..."
mkdir build
cd build
cmake ..
make -j$(nproc)

# Instalar o PySlam (completando a configuração)
echo "Instalando o PySlam..."
sudo make install

# Informações finais
echo "PySlam instalado com sucesso!"
echo "Para rodar o PySlam, navegue até o diretório do repositório clonado e siga as instruções de uso."

# Fim do script
