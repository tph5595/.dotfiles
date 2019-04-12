#!/bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
./update.sh
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
npm install pm2 vtop -g

