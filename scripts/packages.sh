#!/bin/sh
# get up to date nvim
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt install cmake zsh neovim tmux entr htop python3-pip evince \
texlive-full glibc-doc manpages-posix-dev pandoc zathura curl nodejs feh \
qalc duplicity nfs-common qjackctl compton qjackctl pulseaudio-module-jack jackd

pip3 install glances jupyterlab jedi

# https://www.chrisatmachine.com/Neovim/08-fzf/
# sudo apt install fzf ripgrep universal-ctags silversearcher-ag fd-find

# For dwm
sudo apt install libx11-dev libxft-dev libxinerama-dev

# Install ZSH

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#for mac terminal-notifier Caskroom/cask/mactex

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
