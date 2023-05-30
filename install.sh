#!/bin/sh

git_root=`git rev-parse --show-toplevel`
omz_root="${git_root}/.oh-my-zsh" 

# install oh-my-zsh
RUNZSH=no ZSH="${omz_root}" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
./third-party/fzf/install

# link powerlevel10k
ln -s "${git_root}/third-party/powerlevel10k/" "${omz_root}/custom/themes/powerlevel10k"

# copy dotfiles
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
