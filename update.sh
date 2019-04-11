#!/bin/bash
cp ~/.vimrc ~/.vimrc.back
cp .vimrc ~/.vimrc
vim +PluginInstall +qall
