#!/usr/bin/env bash

git clone https://github.com/neovim/neovim.git /tmp/neovim
cd /tmp/neovim
git checkout release-0.7
# dependencies needed to install neovim
sudo apt-get install pkg-config
sudo apt-get install libtool-bin
sudo apt-get install m4
sudo apt-get install automake
# to get the correct version cmake
sudo apt purge --auto-remove cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
sudo apt update
sudo apt install cmake
sudo apt-get install gettext
sudo apt install xsel # for X11
sudo apt install wl-clipboard # for wayland
sudo apt install npm #old version of npm (maybe a problem, maybe not)
sudo npm i -g neovim
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

make CMAKE_BUILD_TYPE=Release
sudo make install

#need to switch to cluster
# pip install pynvim
# pip install pyright

