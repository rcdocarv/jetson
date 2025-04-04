``` shell 
mkdir pbi
cd pbi
wget https://media.datadirect.com/download/files/evals/ODBC/PROGRESS_DATADIRECT_ODBC_MONGODB_LINUX_64.tgz
tar xvzf PROGRESS_DATADIRECT_ODBC_MONGODB_LINUX_64.tgz
sudo apt-get install unixodbc
sudo apt-get update && sudo apt install openjdk-17-jdk
java -version
sudo nano /etc/profile
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile
cd pbi
sudo ./PROGRESS_DATADIRECT_ODBC_8.0_LINUX_64_INSTALL.bin

sudo nano /etc/odbcinst.ini
```
Acrescentar :

[DataDirect MongoDB]
Description=DataDirect MongoDB ODBC Driver
Driver=/opt/Progress/DataDirect/ODBC_80/lib/ivmongo28.so

``` shell 
sudo nano /etc/odbc.ini
```
[MongoDB]
Driver=DataDirect MongoDB
Description=MongoDB DSN
HostName=localhost
PortNumber=27017
Database=mydb
AuthenticationMethod=0

```shell
 sudo apt-get install unixodbc unixodbc-dev
 sudo apt-get update && sudo apt-get install -y unixodbc unixodbc-dev

```
Beleza! Vamos instalar o MongoDB Connector for ODBC (versão 1.4.5) no Ubuntu 14.04 (64 bits). 🚀

🛠️ 1. Instalar Dependências
Antes de extrair o arquivo, instala os pacotes necessários:

bash
Copiar
Editar
sudo apt-get update
sudo apt-get install -y unixodbc unixodbc-dev
Isso garante que o sistema tem tudo que precisa para rodar o ODBC.

📦 2. Extrair o Arquivo
Supondo que o arquivo mongodb-connector-odbc-1.4.5-ubuntu-14.04-64.tar.gz esteja na sua pasta de downloads, rode:

bash
Copiar
Editar
tar -xvzf mongodb-connector-odbc-1.4.5-ubuntu-14.04-64.tar.gz
Isso vai criar uma pasta com os arquivos do driver.

📁 3. Mover os Arquivos para o Diretório Correto
Depois de extrair, mova os arquivos para um local apropriado:

bash
Copiar
Editar
sudo mkdir -p /opt/mongo-odbc
sudo mv mongodb-connector-odbc-1.4.5-ubuntu-14.04-64/* /opt/mongo-odbc/
Agora o driver está armazenado em /opt/mongo-odbc/.

📝 4. Configurar o Driver no /etc/odbcinst.ini
Agora, edite o arquivo do ODBC para registrar o driver:

bash
Copiar
Editar
sudo nano /etc/odbcinst.ini
Adicione o seguinte conteúdo:

ini
Copiar
Editar
[MongoDB ODBC Driver]
Description=MongoDB ODBC Driver
Driver=/opt/mongo-odbc/lib/libmongoodbc_sb64.so
Threading=0
Verifique o caminho do driver (libmongoodbc_sb64.so) dentro da pasta /opt/mongo-odbc/lib/ e ajuste se necessário.

🔗 5. Configurar a Conexão DSN no /etc/odbc.ini
Agora edite o arquivo de configuração do DSN:

bash
Copiar
Editar
sudo nano /etc/odbc.ini
Adicione isso:

ini
Copiar
Editar
[MongoDB]
Description=MongoDB DSN
Driver=MongoDB ODBC Driver
Host=localhost
Port=27017
Database=meubanco
Troque meubanco pelo nome real do seu banco MongoDB.

✅ 6. Testar a Conexão
Agora, testa se o driver está sendo reconhecido:

bash
Copiar
Editar
odbcinst -q -d
Se o MongoDB ODBC Driver aparecer, já estamos no caminho certo.

Agora testa a conexão com:

bash
Copiar
Editar
isql -v MongoDB
Se conectar sem erro, o driver ODBC do MongoDB está funcionando! 🎉

Se der algum erro no caminho, me manda a saída do erro e a gente ajusta! 🚀
