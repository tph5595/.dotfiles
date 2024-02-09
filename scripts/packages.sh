#!/bin/bash
set -euxo pipefail

sudo pacman -Syu cmake zsh neovim tmux entr htop python python-pip python-pipx \
texlive-meta man-pages pandoc zathura curl nodejs wayland sway foot \
duplicity ripgrep rustup zenith

# Install rust
rustup default stable

pipx install glances jupyterlab

#for mac terminal-notifier Caskroom/cask/mactex
