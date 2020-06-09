#!/bin/bash

#setup saving git creds
git config --global credential.helper store

# Copy .config
cp -r ../.config ~/.config

# Setup vim
cp ../vim/.vimrc ~/.vimrc
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir $XDG_CONFIG_HOME/nvim/
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
cp -r ../vim/plug-config $XDG_CONFIG_HOME/nvim/

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall

# Setup zsh
cp ../zsh/.zshrc ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
cp ../zsh/.p10k.zsh ~/.p10k.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

# Setup Ranger
cp -r ~/dotfiles/.config/ranger ~/.config
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# Install Nerd Fonts
mkdir -p ~/repos
cd ~/repos
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh Hack
cd ~/dotfiles

# Setup zathura
cp -r ~/dotfiles/.config/zahura ~/.config
