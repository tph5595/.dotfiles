#!/bin/bash

# Setup vim
cp ../vim/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

#setup zsh
cp ../zsh/.zshrc ~/.zshrc
