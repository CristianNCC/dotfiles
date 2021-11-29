#!/bin/bash

# Optional: Vbox guest additions
# sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

###### Setup dotfiles #####

rm ~/.bashrc
ln -s ~/repos/dotfiles/.bashrc ~/.bashrc

rm ~/.vimrc
ln -s ~/repos/dotfiles/.vimrc ~/.vimrc

rm ~/.aliasrc
ln -s ~/repos/dotfiles/.aliasrc ~/.aliasrc

##### Update and upgrade #####

sudo apt-get update
sudo apt-get upgrade 

##### Tools #####

# Basic programming tools.
sudo apt-get install build-essential vim git

# Analyis tools.
sudo apt-get install clang-tools valgrind

# Misc tools.
sudo apt-get install curl tree mlocate

###### Vim Addons #####

# SuperTab.
mkdir -p ~/.vim/pack/plugins/start
git clone --depth=1 https://github.com/ervandew/supertab.git ~/.vim/pack/plugins/start/supertab

##### Cleanup #####
sudo apt-get autoremove
sudo apt-get clean

##### Ubuntu debloat #####
sudo apt-get remove aisleriot brltty duplicity empathy empathy-common example-content gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects landscape-common libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-galaxy libreoffice-style-human libreoffice-writer libsane libsane-common python3-uno rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common telepathy-gabble telepathy-idle telepathy-indicator telepathy-logger telepathy-mission-control-5 totem totem-common totem-plugins printer-driver-brlaser printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-m2300w printer-driver-ptouch printer-driver-splix
