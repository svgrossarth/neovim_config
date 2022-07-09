#!/usr/bin/env bash

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.7
# dependencies needed to install neovim
sudo apt-get install pkg-config
sudo apt-get install libtool-bin
# to get the correct version cmake
sudo apt purge --auto-remove cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
sudo apt update
sudo apt install cmake
sudo apt-get install gettext

make CMAKE_BUILD_TYPE=Release
sudo make install



