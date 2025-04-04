shell ´´´
curl -LO https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz
curl -LO https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz.sig
gpg --verify mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz.sig mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz
tar -xvzf mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz
sudo mv mongodb-bi-linux-x86_64-debian12-v2.14.14 /opt/mongodb-bi-connector
cd /opt/mongodb-bi-connector
cp example-mongosqld-config.yml mongosqld.conf
nano mongosqld.conf
´´´
