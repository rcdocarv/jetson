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
sudo apt install nvidia-jetpack
sudo apt install -y nvidia-cuda libcudnn8

# adciona ao path/bashrc
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
nvcc --version

# instalar SDK setereolabs
sudo apt install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel cython3 libatlas-base-dev libopenblas-dev
pip3 install --upgrade pip
#pip3 install Cython==0.29.24
#pip3 install numpy==1.21.4
pip install PyOpenGL PyOpenGL_accelerate
sudo apt install zstd
apt-cache policy nvidia-jetpack # consulta a versão do jetpack 4.6.6
wget https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/4.2/ZED_SDK_Tegra_L4T32.7_v4.2.5.zstd.run
chmod +x ZED_SDK_Tegra_L4T32.7_v4.2.5.zstd.run
./ZED_SDK_Tegra_L4T32.7_v4.2.5.zstd.run
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc && source ~/.bashrc
cd /usr/local/zed/
pip install pyzed-4.2-cp38-cp38-linux_aarch64.whl

# INstalação do TensorRT
dpkg -l | grep nvinfer # Verificar Se o tensorRT está instalado
sudo apt update
sudo apt install -y nvidia-tensorrt
ls /usr/lib/aarch64-linux-gnu/ | grep libnvinfer # Verificar se as libs estão instalados
export LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu:$LD_LIBRARY_PATH    # verifica se o tensorrt se encontra no path
echo 'export LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu:$LD_LIBRARY_PATH' >> ~/.bashrc #adiciona o tensor RT ao Path

# INstalar OpenCV
sudo apt install python3.8 python3.8-dev python3.8-venv
sudo apt install -y libjpeg-dev libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev
sudo apt install -y libgtk-3-dev libcanberra-gtk3-module libatlas-base-dev gfortran
sudo apt install -y python3.8-distutils python3.8-dev
pip install --upgrade pip
pip install opencv-python
pip install opencv-contrib-python

