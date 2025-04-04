curl -LO https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz
curl -LO https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz.sig
gpg --verify mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz.sig mongodb-bi-linux-x86_64-debian12-v2.14.14.tgz
