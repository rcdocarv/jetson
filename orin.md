# ORIN

## Configurar Keyboard
setxkbmap pt 

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

torch 2.5.1
cuda 11.5.315
cp 3.12

instalar torch   
https://developer.download.nvidia.com/compute/redist/jp/v51/pytorch/torch-2.0.0a0+8aa34602.nv23.03-cp38-cp38-linux_aarch64.whl

instalar torchvision
wget https://developer.download.nvidia.com/compute/redist/jp/v51/torchvision/torchvision-0.15.0a0+56c67ea.nv23.03-cp38-cp38-linux_aarch64.whl
pip install torchvision-0.15.0a0+56c67ea.nv23.03-cp38-cp38-linux_aarch64.whl

pip install torchaudio
pip install ultralytics
python -c "from ultralytics import YOLO; model = YOLO('yolov8n.pt'); print('Modelo carregado com sucesso')"
