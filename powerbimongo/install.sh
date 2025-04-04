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
```
