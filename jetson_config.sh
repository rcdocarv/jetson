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

# MINIMAL CUDA E CudNN (Pacotes minimos individuais)
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.2.460-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.2.460-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt update

# FULL CUDA E CudNN (versão completa)
# sudo apt search nvidia-jetpack
# sudo apt install -y nvidia-cuda-toolkit libcudnn8

# adciona ao path/bashrc
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
nvcc --version
