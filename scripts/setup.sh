#!/bin/bash

#setup saving git creds
git config --global credential.helper store

# Copy .config
cp -r ../.config/* ~/.config/

# Setup nvim package manager Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
# Oh my tmux setup
git clone https://github.com/gpakosz/.tmux.git
mkdir -p ~/.config/tmux
ln -s $(pwd)/.tmux/.tmux.conf ~/.config/tmux/tmux.conf
cp .tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local

# Setup zsh
cp ../zsh/.zshrc ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
cp ../zsh/.p10k.zsh ~/.p10k.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

# Setup Ranger
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# Setup dwm
sudo cp ../dwm.desktop /usr/share/xsessions/dwm.desktop

# Install Nerd Fonts
mkdir -p ~/repos
cd ~/repos
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Hack
cd ~/dotfiles

git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
