#!/usr/bin/env bash

git clone https://github.com/neovim/neovim.git /tmp/neovim
cd /tmp/neovim
git checkout release-0.7
# dependencies needed to install neovim
sudo apt-get install pkg-config libtool-bin m4 automake -y



# to get the correct version cmake
sudo apt purge --auto-remove cmake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
sudo apt update
sudo apt-get install cmake gettext xsel -y 

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


# you have to install the lsp via the :lspinstall thing
