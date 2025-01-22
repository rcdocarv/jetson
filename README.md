# jet
**remover desnecessarios**
depois desta acção a jetson terá aproximadamente 9.1Gb livres
```shell
sudo apt remove --purge libreoffice -y
sudo apt remove --purge remmina thunderbird* transmission -y
sudo apt remove --purge cheese* smplayer lxmusic -y
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


