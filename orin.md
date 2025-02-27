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
Este passo é vital para termos CUDA e cuDNN suportado em python para o pytorch, caso contrário estaremos apenas a usar o CPU com uma perda de rendimento gigantesca!
### Documentação Nvidia

Links da documentação da Nvidia [Pytorch jetson platforms](https://docs.nvidia.com/deeplearning/frameworks/install-pytorch-jetson-platform/index.html) 

Uma alma caida do ceu que detalhou toda a compatiblidade de versões [Nvidia Soul](https://forums.developer.nvidia.com/t/pytorch-for-jetson/72048)

Entrando no ultimo link, verificamos pelo comando **jtop** que a nossa versão de jetpack é 5.1.1. Pelo ultimo link isso leva-nos para uma wheel de python *https://developer.download.nvidia.cn/compute/redist/jp/v512/pytorch/torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl*, no entanto a nossa versao não é a v512 mas sim a v511 (v5.1.1) como vemos na saida do comando `jtop` abaixo.

<div align="center">
  <img src="jtop_zedBox.png" alt="Logo do Projeto" width="650">
</div>

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
Portanto segundo a saida do ultimo comando a nossa versão é de março de 2023 corresponde ao nv23.03 *(nvYY.MM)*, ou seja é um Nvidia version de 2023, março!

### Descobrir a nossa wheel compativel de pytorch
**Dos comandos atras e da wheel** *torch-2.1.0a0+41361538.nv23.06-cp38-cp38-linux_aarch64.whl* **sabemos:** 
 - **v511**       jetpack 5.1.1 instalado no sistema operativo da SoM.
 - **nv23.03**    Versão Nvidia tem haver com compilações linux for tegra (l4t), nvcc entre outros.
 - torch-x.x  **Precisamos determinar a versão suportada**, tendo em consideração as versões anteriores de Jetpack e Nvidia, teremos uma versão suportada de pytorch.
 - cpxx-cpyy  **Precisamos determinar a versão suportada**, cp refere-se implementação com recurso a cPython! O cpxx-cpxx, diz repeito á complição e compatiblidade. Assim imagenmos que temos **cp38-cp39**, o primeiro cp38 significa que o ABI (Application Binary Interface) do python ou seja a versão que integra e compila a parte em c/c++ e restantes libs foi feita com uma versão de cPython equivalente ao Python3.8. Já o segundo o cp39 indica refe-se ao build do Python propriamente dito, seja diz-nos que este pacote iria rodar em python 3.9. É determinante para criar o ambiente conda.
 
Se encurtarmos o link da wheel atrás https://developer.download.nvidia.com/compute/redist/jp/ temos uma listagem de directorio por Nvidia Jetpack.
<div align="center">
  <img src="nv_jetpacks.png" alt="Logo do Projeto" width="350">
</div>

Sabemos que a nossa versão de jetpack é a v5.1.1  vamos clicamos em v511, depois abrirá outra listagem de directorio onde iremos escolher de pytorch, mas nas wheels que vão abrir nenhuma tem o nv23.03 então a solução é no link modificar o v511 para v51 (ou jetpack v5.1.0), ao entrar nesse link (https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/), temos as seguintes wheels disponiveis.

 1. https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-1.14.0a0+44dac51c.nv23.01-cp38-cp38-linux_aarch64.whl
 2.  https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-1.14.0a0+44dac51c.nv23.02-cp38-cp38-linux_aarch64.whl
 3.  https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-2.0.0a0+8aa34602.nv23.03-cp38-cp38-linux_aarch64.whl

**Analisando as Wheels**, a pimeira coisa  fazer é verificar a versão nv, e verificamos que existe a nosssa nv23.03, na opção 3, esta será a nossa wheel.

### Instalar a Whell Pytorch+CUDA+cuDNN

Pela nossa wheel que determina-mos atrás sabemos que a versão de python é a 3.8 (cp38-cp38), então vamos criar um enviroment de conda para a versão python3.8.
```shel
conda create --name py38Cuda python=3.8
conda activate py38Cuda
```
E depois baixamos e instalamos a wheel, eventualmente haverá muitas dependência que irá pedir para instalar, se houver necessidade de instalar algum pacote manualmente dê sempre preferencia a `conda install numpy`, ao invés do pip.
``` shell
wget https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-2.0.0a0+8aa34602.nv23.03-cp38-cp38-linux_aarch64.whl
pip install torch-2.0.0a0+8aa34602.nv23.03-cp38-cp38-linux_aarch64.whl
```
Entretanto vamos precisar do torchVision que é o modulo de pytorch responsavel pela parte visual de processamento de imagem e video, se consultamos o link atrás [Nvidia Soul](https://forums.developer.nvidia.com/t/pytorch-for-jetson/72048), verificamos que para a nossa versão de PyTorch v2.0 - torchvision v0.15.1.

Também podemos verificar no git do pytorch [pytorch](https://github.com/pytorch/vision?tab=readme-ov-file), para um torch de 2.0 como o do exemplo temos de colocar o torchvision 0.15 que é suportado por uma versão 3.8 a 3.11 de python, embora não devemos descurar o build python da nvidia porque o torch deste git não tem CUDA para aarch. Assim o python que temos de usar é o 3.8! Então vamos instalar o torchvision:

```shell
conda install -c pytorch torchvision=0.16.1
```
Alternativamente podemos usar o pip:
``` shell
pip install torchvision==0.15.0
```
Ou diretamente do repositorio, baixando o codigo fonte e compilar:
```shell
git clone https://github.com/pytorch/vision.git
cd vision
git checkout v0.15.0
python setup.py install
```
e por fim fim verificar as versões instaladas.
``` shell
$ python -c "import torchvision; print(torchvision.__version__)"
> 0.15.0
```
