#!/bin/sh
sudo apt install cmake zsh neovim tmux entr htop python3-pip evince texlive-full glibc-doc manpages-posix-dev pandoc zathura ranger curl
pip3 install glances jupyterlab jedi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#for mac terminal-notifier Caskroom/cask/mactex
