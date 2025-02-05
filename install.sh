#!/bin/sh

`git submodule update --recursive --init`

if [ ! -n  `which zsh` ]; then
   # 
   echo "Need to install ZSH for this setup"
   exit 1 
fi

git_root=`git rev-parse --show-toplevel`
omz_root="${git_root}/.oh-my-zsh"

# install oh-my-zsh
RUNZSH=no ZSH="${omz_root}" REPO=ohmyzsh/ohmyzsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
./third-party/fzf/install --all

# link powerlevel10k
ln -sf "${git_root}/third-party/powerlevel10k/" "${omz_root}/custom/themes/powerlevel10k"

# copy dotfiles
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
cp "${git_root}/third-party/zsh-autosuggestions/zsh-autosuggestions.zsh" ~/.zsh-autosuggestions.zsh
