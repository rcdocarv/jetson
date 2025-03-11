# jet
**remover desnecessarios**
depois desta acção a jetson terá aproximadamente 9.1Gb livres
```shell
sudo apt remove --purge libreoffice* -y
sudo apt remove --purge remmina thunderbird* transmission -y
sudo apt remove --purge cheese* smplayer lxmusic rhythmbox shotwell -y
sudo apt remove --purge unity* -y
sudo apt remove --purge gnome* -y
sudo apt remove --purge openbox* -y
sudo apt autoremove --purge -y
```

**Upgrade para versão mais recente do pacotes**
```shell
sudo apt update
apt install nano
sudo apt upgrade && sudo apt dist-upgrade
crontab -e
@reboot jetson_clocks --fan
```
**PIP e jtop**
```shell
sudo apt install python3-pip -y
sudo pip3 install -U jetson-stats
sudo systemctl restart jtop.service
jtop
jetson_release
```
**CUDA**
```shell
sudo nano ~/.bashrc
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
source ~/.bashrc
sudo apt install nvidia-cuda
sudo apt install nvidia-cuda-toolkit -y
/usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery
```

## Docker ROS+ZED_SDK
Este é o docker oficial `stereolabs/zed:4.0-devel-l4t-r35.2` da ZED com o ZED SDK, mas optou-se por este `husarion/zed-jetson:noetic` por já trazer o ROS integrado com o SDK da Setereolabs para cameras ZED. Depois descobriu-se um [Git do Husarion](https://github.com/husarion/zed-docker), com varias versões de ROS 1 e 2 e a anterior era a versão **NOETIC** que é ROS 1.

### Instalação do docker
```shell
sudo apt update
sudo apt install docker.io
sudo apt install nvidia-docker2
sudo systemctl restart docker
#sudo docker run --rm --runtime nvidia nvidia/cuda:11.0-base nvidia-smi
sudo docker pull husarion/zed-jetson:melodic
cd zed-docker
#sudo docker build -t husarion/zed-jetson .
sudo docker images
#sudo docker run --runtime nvidia -it --rm --privileged --device /dev/video0 --entrypoint /bin/bash husarion/zed-jetson:melodic
sudo docker run --runtime nvidia -it --privileged --device /dev/video0 --entrypoint /bin/bash husarion/zed-jetson:melodic

cd /
source ../ros_entrypoint.sh
nvcc --version # se comando não for encontrado
export CUDA_HOME=/usr/local/cuda-10.2
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
# ou adiconar ao ~/.bashrc ## nano ~/.bashrc

```
Instalar o WorkSpace
```shell
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws
catkin_make
```
### Gestão de Dockers
Lista os dockers instalados no sistema.
```shell
$ sudo docker images
> REPOSITORY                 TAG       IMAGE ID       CREATED         SIZE
> husarion/zed-jetson        melodic   cf70f77cab2d   22 months ago   2.31GB
> dustynv/jetson-inference   r32.6.1   5363eb4a3327   3 years ago     2.71GB
```
Para listar imagens e containers temos o comando `sudo docker system df`

## Jetson-containers**
https://github.com/dusty-nv/jetson-containers/tree/master

### install the container tools
https://github.com/dusty-nv/jetson-containers/blob/master/docs/setup.md
```shell
git clone https://github.com/dusty-nv/jetson-containers
bash jetson-containers/install.sh
```
### automatically pull & run any container

https://github.com/dusty-nv/jetson-containers/tree/master/packages/l4t/l4t-pytorch
```shell
jetson-containers run $(autotag l4t-pytorch)
```

```shell
sudo apt update
sudo apt install -y nvidia-container-toolkit
sudo systemctl restart docker
sudo apt update
sudo apt install -y nvidia-container-toolkit
```

https://www.waveshare.com/wiki/JETSON-NANO-DEV-KIT

[https://github-com.translate.goog/dusty-nv/jetson-inference?_x_tr_sl=en&_x_tr_tl=pt-PT&_x_tr_hl=pt-PT&_x_tr_pto=wapp#deploying-deep-learning](https://github.com/dusty-nv/jetson-inference)

[SdCard](https://forums.developer.nvidia.com/t/jetson-nano-enable-sdmmc3-for-sd-card/165148/3?utm_source=chatgpt.com)

[sdcard 2](https://forums.developer.nvidia.com/t/microsd-card-not-detected-on-jetson-nano-production-module/80776/9)

```shell
cd /boot/dtb/
dtc -I dtb -O dts kernel_tegra210-p3448-0000-p3449-0000-b00.dtb > kernel_tegra210-p3448-0000-p3449-0000-b00.dts
sdhci@700b0400 {
    status = "okay";
};
dtc -I dts -O dtb -o kernel_tegra210-p3448-0000-p3449-0000-b00.dtb tegra210.dts
```

```
Atualize os pacotes
bash
Copiar
Editar
sudo apt update && sudo apt upgrade -y
Instale o Docker
bash
Copiar
Editar
sudo apt install -y docker.io
Adicione seu usuário ao grupo Docker (para rodar sem sudo)
bash
Copiar
Editar
sudo usermod -aG docker $USER
newgrp docker  # Aplica a mudança sem precisar reiniciar
sudo apt install -y nvidia-container-runtime
sudo systemctl restart docker
sudo docker pull dustynv/jetson-inference:r32.6.1
sudo docker run --runtime nvidia -it --rm --network host dustynv/jetson-inference:r32.6.1

``` 
<div style="background-color: #00ff00; padding: 10px;">
    credo
```shell
 curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
```
</div>
