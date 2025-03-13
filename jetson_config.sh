# remove softwares desnecessarios
sudo apt update
sudo apt remove --purge chromium-browser libreoffice* remmina thunderbird* transmission cheese* smplayer lxmusic rhythmbox shotwell unity* gnome* openbox* -y
sudo apt autoremove --purge -y
sudo apt install language-pack-pt nano iceweasel python3.8 -y 

# coniguração do fuso horario
sudo dpkg-reconfigure tzdata

# Configuração de teclado
sudo dpkg-reconfigure keyboard-configuration

# Verificação de pacotes 
dpkg –-configure -a
apt -f install

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
