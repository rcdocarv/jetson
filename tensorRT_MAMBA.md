# Instalar TensorRT em mamba

O tensorRT vem instalado no sistema nativo e no python nativo! Devido a dependencias com outros packages como o pytorch e numpy e versoes especificas de cada um com a versao suportada de python para o devido jetpack e numpy compativel com torch e opencv optou-se sempre por um ambiente conda!!!
Deste modo dado que o TensorRT nos e fornecido pela instalaçao do JetPack dado que este sistema operativo, corre ubuntu 20.04 LTS (L4T) ou seja linux for tegra o tensorRT nao e instalavel via apt vem na instalaçao do jetpack distruibuido pela nvidia.
Qualquer instalaçao via apt do tensorrt para python ou forçada via pip/whl/conda/manba/repo danifica ''permanentemente o sistema operativo !!!!''

Assim optou-se por uma soluçao, segura aparentemente fragil na robustez mas por ter partes compiladas para o hardware nao tem como contornar!
Esta Soluçao acento num soflink do modulo tensorRT instalado no python nativo para dentro do ambiente Mamba/Conda.

---

## Determinaçao do path do enviroment
### Verificar o ambiente ativo no Python
**Ativar o ambiente conda primeiro** deve ter a mesma versao de python que oficialmente suportada pelo jetpack!

Pelos comandos abaixo identifica-se o path do enviroment, entramos na pasta do mesmo.
```bash
python -c "import sysconfig; print(sysconfig.get_paths()['purelib'])"
#=> /home/star/.local/share/mamba/envs/3py08
cd /home/star/.local/share/mamba/envs/3py08
```

## Criaçao do softlink

ln -s /usr/lib/python3/dist-packages/tensorrt tensorrt

## 🔹 2. Itálico e Negrito

| Estilo | Markdown | Resultado |
|:-------|:----------|:-----------|
| **Itálico** | `*texto*` ou `_texto_` | *texto* |
| **Negrito** | `**texto**` ou `__texto__` | **texto** |
| **Negrito + Itálico** | `***texto***` | ***texto*** |

---

## 🔹 3. Combinar estilos dentro de código

👉 **Importante:**  
Dentro de blocos de código (\`\`\` … \`\`\`), **Markdown não é interpretado** — o texto é mostrado literalmente.  

Se queres negrito ou itálico *fora* de um bloco de código mas ainda destacando código curto:
```md
O comando **`sudo apt update`** atualiza os pacotes.
