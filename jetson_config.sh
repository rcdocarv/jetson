#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update
# Remove softwares desnecessários
sudo apt remove --purge -y \
    chromium-browser libreoffice* remmina thunderbird* transmission \
    cheese* smplayer lxmusic rhythmbox shotwell
    
# Remover pacotes órfãos
sudo apt autoremove --purge -y

# Instala pacotes essenciais
sudo apt install -y language-pack-pt nano iceweasel python3.8 

# Define o python por defeito a versão 3.8
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo update-alternatives --set python3 /usr/bin/python3.8

# Configuração do fuso horário
sudo dpkg-reconfigure tzdata

# Configuração do teclado
sudo dpkg-reconfigure keyboard-configuration

# Corrigir pacotes quebrados
sudo dpkg --configure -a
sudo apt --fix-broken install
sudo apt -f install

# Atualizar e melhorar o sistema
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Instala Jetson TOP 
sudo apt install python3-pip -y
sudo pip3 install -U jetson-stats
sudo systemctl restart jtop.service
jtop
jetson_release

# Configura a FAN
(crontab -l 2>/dev/null; echo "@reboot jetson_clocks --fan") | crontab -
echo "Fan Configurada"

# FULL CUDA E CudNN (versão completa)
sudo apt search nvidia-jetpack
sudo apt install -y nvidia-cuda-toolkit libcudnn8

# adciona ao path/bashrc
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
nvcc --version

# Instalar Opencv setuptools whell 
python -m pip install --upgrade pip setuptools wheel
sudo apt install build-essential cmake
pip3 install scikit-build
pip3 install opencv-contrib-python

python -m pip install cython numpy pyopengl

# instalar SDK setereolabs
sudo apt install zstd
apt-cache policy nvidia-jetpack # consulta a versão do jetpack 4.6.6

