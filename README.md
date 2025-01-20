# jet

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
### install the container tools
git clone https://github.com/dusty-nv/jetson-containers
bash jetson-containers/install.sh

### automatically pull & run any container
jetson-containers run $(autotag l4t-pytorch)

https://github.com/dusty-nv/jetson-containers/tree/master/packages/l4t/l4t-pytorch
```shell
sudo apt update
sudo apt install -y nvidia-container-toolkit
sudo systemctl restart docker
sudo apt update
sudo apt install -y nvidia-container-toolkit
```

~~**OPEN CV + CUDA**~~
```shell
git clone https://github.com/mdegans/nano_build_opencv
cd nano_build_opencv
-- nao tem CUDA continuar depois https://www.youtube.com/watch?v=BCNnqTFi-Gs&t=3s
https://github.com/mdegans/nano_build_opencv
```

## Título do documento
Este é um exemplo de como usar Markdown no GitHub.

**Texto em negrito**.

*Lista não ordenada:*
  * Item 1
  * Item 2

**Bloco de código:**
```javascript
function hello() {
  console.log('Hello, world!');
}
```

**Observação:** A aparência exata do texto formatado pode variar ligeiramente dependendo da ferramenta ou plataforma que está sendo usada para renderizar o Markdown.

**Recursos adicionais:**

* **Documentação oficial do GitHub:** https://docs.github.com/pt/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github
* **Guia rápido de gravação no GitHub:** https://docs.github.com/pt/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/quickstart-for-writing-on-github

Com essas informações, você poderá formatar seus textos no GitHub de forma clara e organizada.

**Gostaria de saber mais sobre algum outro recurso do Markdown?**
