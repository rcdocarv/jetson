# Instalação da zed2i na zed box (Jetson Orin NX)

Para instalação do setereolabs SDK  para dar suporte á camera vamos seguir este link da [Setereolabs](https://www-stereolabs-com.translate.goog/docs/get-started-with-zed-box-orin-nx/installation?_x_tr_sl=en&_x_tr_tl=pt-PT&_x_tr_hl=pt-PT&_x_tr_pto=wapp)

Portanto sabe qual a versão do jetpack
``` shell
$ apt-cache policy nvidia-jetpack
>  nvidia-jetpack:
>  Installed: 5.1.1-b56
>  Candidate: 5.1.1-b56
>  Version table:
>  *** 5.1.1-b56 500
>        500 https://repo.download.nvidia.com/jetson/common r35.3/main arm64 Packages
>        100 /var/lib/dpkg/status
```
Então na página dos [SDK Downloads](https://www.stereolabs.com/en-pt/developers/release) avançamos, fez-se download do [ZED SDK for JetPack 5.1.1 (L4T 35.3) 4.2 (Jetson Xavier, Orin AGX/NX/Nano, CUDA 11.4)](https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/4.2/ZED_SDK_Tegra_L4T35.3_v4.2.5.zstd.run), ou `wget https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/4.2/ZED_SDK_Tegra_L4T35.3_v4.2.5.zstd.run`

Depois damos permissão de execução e instalamos.
``` shell
sudo apt install zstd
chmox +x ZED_SDK_Tegra_L4T35.3_v4.2.5.zstd.run
./ZED_SDK_Tegra_L4T35.3_v4.2.5.zstd.run
```
Depois é necessário ir a `cd /usr/local/zed` e correr no ambiente python pretendido conda ou não `pip install pyzed-4.2-cp38-cp38-linux_aarch64.whl`. Para que ao fazer `import pyzed.sl as sl` não dê erro!
