#!/bin/bash

# Setup vim
cp ../vim/.vimrc ~/.vimrc
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

#setup zsh
cp ../zsh/.zshrc ~/.zshrc

mkdir -p ~/repos
cd ~/repos
git clone https://github.com/alexanderjeurissen/ranger_devicons
cd ranger_devicons && make install 
cd -
