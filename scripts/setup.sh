#!/bin/bash

#setup saving git creds
git config --global credential.helper store

# Copy .config
cp -r ../.config/* ~/.config/

# Nvim setup through .config dir
# mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
# mkdir $XDG_CONFIG_HOME/nvim/
# ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
# cp -r ../vim/plug-config $XDG_CONFIG_HOME/nvim/

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
# Oh my tmux setup
git clone https://github.com/gpakosz/.tmux.git "/path/to/oh-my-tmux"
mkdir -p "~/.config/tmux"
ln -s "/path/to/oh-my-tmux/.tmux.conf" "~/.config/tmux/tmux.conf"
cp "/path/to/oh-my-tmux/.tmux.conf.local" "~/.config/tmux/tmux.conf.local"

# Setup zsh
cp ../zsh/.zshrc ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
cp ../zsh/.p10k.zsh ~/.p10k.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

# Setup Ranger
# cp -r ~/dotfiles/.config/ranger ~/.config
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

# Setup zathura
# cp -r ~/dotfiles/.config/zahura ~/.config

git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
