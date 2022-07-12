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
# install node and npm
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm i -g neovim
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
sudo curl -LO https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-musl_8.4.0_amd64.deb #something didn't work with this
sudo dpkg -i fd_8.4.0_amd64.deb

make CMAKE_BUILD_TYPE=Release
sudo make install

#need to switch to cluster
# pip install pynvim
# pip install pyright
# pip install black
# pip install flake8
# pip install debugpy


# you have to install the lsp via the :lspinstall thing
