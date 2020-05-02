#!/bin/bash

# Setup vim
cp ../vim/.vimrc ~/.vimrc
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall

cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

# Setup zsh
cp ../zsh/.zshrc ~/.zshrc
cp ../zsh/.p10k.zsh ~/.p10k.zsh

# Setup Ranger
mkdir -p ~/repos
cd ~/repos
git clone https://github.com/alexanderjeurissen/ranger_devicons
cd ranger_devicons && make install 
cd -
