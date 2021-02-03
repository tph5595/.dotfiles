#!/bin/sh
sudo apt install cmake zsh neovim tmux entr htop python3-pip evince \
texlive-full glibc-doc manpages-posix-dev pandoc zathura ranger curl nodejs feh \
qalc suckless-tools duplicity nfs-common

pip3 install glances jupyterlab jedi

# https://www.chrisatmachine.com/Neovim/08-fzf/
sudo apt install fzf ripgrep universal-ctags silversearcher-ag fd-find

# For dwm
sudo apt install libx11-dev libxft-dev libxinerama-dev

# Install ZSH

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#for mac terminal-notifier Caskroom/cask/mactex
