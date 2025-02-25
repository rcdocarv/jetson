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

## jtop
``` shell
sudo apt install python3-pip -y
sudo pip3 install -U jetson-stats
sudo systemctl restart jtop.service
jtop
jetson_release
```

<div align="center">
  <img src="jtop.gif" alt="Logo do Projeto" width="400">
</div>
https://forums.developer.nvidia.com/t/pytorch-for-jetson/72048

https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-1.14.0a0+44dac51c.nv23.01-cp38-cp38-linux_aarch64.whl
https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-1.14.0a0+44dac51c.nv23.02-cp38-cp38-linux_aarch64.whl
https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-2.0.0a0+8aa34602.nv23.03-cp38-cp38-linux_aarch64.whl

portanto qualquer uma delas apenas compativel com python3.8
verificar o nv:
dpkg-query --show nvidia-jetpack
nvidia-jetpack	5.1.1-b56
head -n 1 /etc/nv_tegra_release
R35 (release), REVISION: 3.1, GCID: 32827747, BOARD: t186ref, EABI: aarch64, DATE: Sun Mar 19 15:19:21 UTC 2023
portanto março de 23 corresponde ao nv23.03

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
pip install ultralytics

python -c "from ultralytics import YOLO; model = YOLO('yolov8n.pt'); print('Modelo carregado com sucesso')"
