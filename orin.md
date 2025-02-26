# ORIN
## Configurar Keyboard Timezone Lang locale
### keyboard
*Se quiser corrigir o layout do tecldo para facilitar a entrada dos proximos comandos* `setxkbmap pt` 
``` shell
sudo apt update && sudo apt install nano
sudo nano /etc/default/keyboard
XKBLAYOUT="pt"
sudo dpkg-reconfigure keyboard-configuration
```
Depois de correr o ultimo comando precisará de escolher as seguintes opções, nas janelas subsequentes.
1.	Generic 105-key PC (intl.)*
2.	Portuguese
3.	Portuguese – Portuguese (no dead keys)
4.	The Default for the keyboard layout
5.	Right Alt (AltGr)
6.	Ctrl+Alt+del to terminate X <YES>

### timezone
Assim o timedate fica defenido no nosso fuso horário. 
``` shell
sudo dpkg-reconfigure tzdata
timedatectl #para verificar se o timezone foi aplicado
```
### lang
``` shell
sudo apt update
sudo apt install language-pack-pt -y
sudo apt install language-pack-gnome-pt -y
```
### locales
Editamos o ficheiro `sudo nano /etc/default/locale` e substituímos pelo conteudo abaixo. 
``` shell
LANG="pt_PT.UTF-8"
LANGUAGE="pt_PT:pt:en"
LANGUAGE="pt_PT:pt"
LC_ALL="pt_PT.UTF-8"
```
Depois é so correr `sudo dpkg-reconfigure locales` atualizar os locales.

## jtop - jetson TOP
O **jtop** permite-nos, verificar se o CUDA ou cuDNN estão correctamente instalados no sistema assim como versões de jetpack, ou utlização de recursos da Orin NX.
<div align="center">
  <img src="jtop.gif" alt="Logo do Projeto" width="450">
</div>

``` shell
sudo apt install python3-pip -y
sudo pip3 install -U jetson-stats
sudo systemctl restart jtop.service
jtop
jetson_release
```
## conda
O conda será extramente util para criar dversos ambientes para por exemplo instalar o pytorch especifico para esta SoM sem necessidade de resolver conflitos.
Esta instalação corre especifica para aarch64, demora tem **manba**, **miniforge** (~4Gb).
``` shell
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh
chmod +x Miniforge3-Linux-aarch64.sh
./Miniforge3-Linux-aarch64.sh
source ~/miniforge3/bin/activate
conda activate / deactivate
conda --version
```

## Pytorch+CUDA+cuDNN

<div align="center">
  <img src="jtop_zedBox.png" alt="Logo do Projeto" width="650">
</div>

**Documentation Nvidia**

Links da documentação da Nvidia [Pytorch jetson platforms](https://docs.nvidia.com/deeplearning/frameworks/install-pytorch-jetson-platform/index.html) 

Uma alma caida do ceu que detalhou toda a compatiblidade de versões [Nvidia Soul](https://forums.developer.nvidia.com/t/pytorch-for-jetson/72048)

Entrando no ultimo link, verificamos pelo comando **jtop** que a nossa versão de jetpack é 5.1.1. Isso leva-nos para uma wheel de python *https://developer.download.nvidia.cn/compute/redist/jp/v512/pytorch/torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl*, no entanto a nossa versao não é a 512 mas sim a 511 como vemos no comando abaixo.

Também podemos verificar o Jetpack pelo comando: 
``` shell
$ dpkg-query --show nvidia-jetpack
> nvidia-jetpack	5.1.1-b56
```

Para verificar o nv:
``` shell
$ head -n 1 /etc/nv_tegra_release
> R35 (release), REVISION: 3.1, GCID: 32827747, BOARD: t186ref, EABI: aarch64, DATE: Sun Mar 19 15:19:21 UTC 2023
```
Portanto segunda a saida do comando a nossa versão é de março de 2023 corresponde ao nv23.03 *(nvYY.MM)*
**Do link da wheel interpretamos:** 
 - **v512**       jetpack 5.1.2
 - **nv23.03**    Versão Nvidia
 - **torch-2.1**  Precisamos determinar a versão suportada
 - **cp38**       Precisamos determinar a versão suportada

Por estas informações temos criar um enviroment de conda com o python3.8 para termos torch com CUDA

Portanto se alterar-mos no link **v** referente ao jetpack,ele da-nos as versões de pytorch correspondentes. 
https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-1.14.0a0+44dac51c.nv23.01-cp38-cp38-linux_aarch64.whl
https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-1.14.0a0+44dac51c.nv23.02-cp38-cp38-linux_aarch64.whl
https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-2.0.0a0+8aa34602.nv23.03-cp38-cp38-linux_aarch64.whl
##

*torch 2.5.1
*cuda 11.5.315
*cp 3.12
instalar torch 
``` shell
  
https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-2.0.0a0+8aa34602.nv23.03-cp38-cp38-linux_aarch64.whl
```
instalar torchvision
wget https://developer.download.nvidia.com/compute/redist/jp/v51/torchvision/torchvision-0.15.0a0+56c67ea.nv23.03-cp38-cp38-linux_aarch64.whl
pip install torchvision-0.15.0a0+56c67ea.nv23.03-cp38-cp38-linux_aarch64.whl

pip install torchaudio
