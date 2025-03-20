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

# reinstalação cmake
wget https://github.com/Kitware/CMake/releases/download/v4.0.0-rc4/cmake-4.0.0-rc4-linux-aarch64.sh
chmod +x cmake-4.0.0-rc4-linux-aarch64.sh
./cmake-4.0.0-rc4-linux-aarch64.sh --prefix=/opt/cmake --skip-license
echo 'export PATH=/opt/cmake/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
cmake --version

# retirar docker
sudo systemctl stop docker
sudo systemctl disable docker
sudo docker ps -q | xargs -r sudo docker stop
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
sudo apt-get purge -y nvidia-docker2 nvidia-container-runtime nvidia-container-toolkit
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo rm -rf /var/lib/docker
sudo rm -rf /etc/docker
sudo rm -rf /var/lib/containerd
sudo find / -name '*docker*' -exec rm -rf {} +
sudo groupdel docker
sudo reboot
