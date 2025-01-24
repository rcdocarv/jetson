# ORIN
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
pip install https://download.pytorch.org/whl/torch/torch-2.0.0+cu118-cp310-cp310-win_amd64.whl
