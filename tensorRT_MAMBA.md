# Instalar TensorRT em mamba

O tensorRT vem instalado no sistema nativo e no python nativo! Devido a dependencias com outros packages como o pytorch e numpy e versoes especificas de cada um com a versao suportada de python para o devido jetpack e numpy compativel com torch e opencv optou-se sempre por um ambiente conda!!!
Deste modo dado que o TensorRT nos e fornecido pela instalaçao do JetPack dado que este sistema operativo, corre ubuntu 20.04 LTS (L4T) ou seja linux for tegra o tensorRT nao e instalavel via apt vem na instalaçao do jetpack distruibuido pela nvidia.
Qualquer instalaçao via apt do tensorrt para python ou forçada via pip/whl/conda/manba/repo danifica ''permanentemente o sistema operativo !!!!''

Assim optou-se por uma soluçao, segura aparentemente fragil na robustez mas por ter partes compiladas para o hardware nao tem como contornar!
