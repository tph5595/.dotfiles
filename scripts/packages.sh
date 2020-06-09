#!/bin/sh
sudo apt install cmake zsh neovim tmux entr htop python3-pip evince texlive-full glibc-doc manpages-posix-dev pandoc zathura ranger curl
pip3 install glances jupyterlab jedi

# https://www.chrisatmachine.com/Neovim/08-fzf/
sudo apt install fzf

sudo apt install ripgrep

sudo apt install universal-ctags

sudo apt install silversearcher-ag

sudo apt install fd-find

# Install ZSH

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#for mac terminal-notifier Caskroom/cask/mactex
