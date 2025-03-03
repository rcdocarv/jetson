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
Então na página dos [SDK Downloads](https://www.stereolabs.com/en-pt/developers/release#82af3640d775), fez-se download do [SDK](https://download.stereolabs.com/zedsdk/4.2/l4t35.3/jetsons?_gl=1*tdtmrh*_gcl_au*MTQwNjc3NTc5Ny4xNzQwNjY0Mjcx)
