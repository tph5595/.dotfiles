#!/bin/bash

#setup saving git creds
git config --global credential.helper store

# Copy .config
cp -r .config ~/.config

# Setup vim
cp ../vim/.vimrc ~/.vimrc
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall

cd ~/.config/nvim/plugged/YouCompleteMe
./install.py --clang-completer

# Setup zsh
cp ../zsh/.zshrc ~/.zshrc
cp ../zsh/.p10k.zsh ~/.p10k.zsh

# Setup Ranger
mkdir -p ~/repos
cd ~/repos
git clone https://github.com/alexanderjeurissen/ranger_devicons
cd ranger_devicons && make install 
cd -
