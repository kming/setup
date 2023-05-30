#!/bin/sh

# install oh-my-zsh
RUNZSH=no ZSH=~/.setup/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
./third-party/fzf/install

# link powerlevel10k
ln -s ~/.setup/third-party/powerlevel10k/ .oh-my-zsh/custom/themes/powerlevel10k

# copy zshrc
cp .zshrc ~/.zshrc
