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
