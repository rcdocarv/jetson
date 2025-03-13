#!/bin/bash

# Atualiza a lista de pacotes
sudo apt update
# Remove softwares desnecessários
sudo apt remove --purge -y \
    chromium-browser libreoffice* remmina thunderbird* transmission \
    cheese* smplayer lxmusic rhythmbox shotwell
    
# Remover pacotes órfãos
sudo apt autoremove --purge -y

# Instala pacotes essenciais
sudo apt install -y language-pack-pt nano iceweasel python3.8 

# Configuração do fuso horário
sudo dpkg-reconfigure tzdata

# Configuração do teclado
sudo dpkg-reconfigure keyboard-configuration

# Corrigir pacotes quebrados
sudo dpkg --configure -a
sudo apt --fix-broken install
sudo apt -f install

# Atualizar e melhorar o sistema
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

