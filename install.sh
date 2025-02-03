#!/bin/sh

`git submodule update --recursive --init`

if [ ! -n  `which zsh` ]; then
   # 
   echo "Need to install ZSH for this setup"
   exit 1 
fi

git_root=`git rev-parse --show-toplevel`
omz_root="${git_root}/.oh-my-zsh"
alias_root="${git_root}/alias-cmds"

# install oh-my-zsh
RUNZSH=no ZSH="${omz_root}" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
./third-party/fzf/install --all

# link powerlevel10k
ln -sf "${git_root}/third-party/powerlevel10k/" "${omz_root}/custom/themes/powerlevel10k"

# copy dotfiles
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh
cp "${git_root}/third-party/zsh-autosuggestions/zsh-autosuggestions.zsh" ~/.zsh-autosuggestions.zsh

# Add folder for alias-cmds to path + add an alias to setting up the mds
echo "export PATH=\"$alias_root:$PATH\"" >> ~/.zshrc
echo "alias setup-alias-cmds=\"alias-cmds.zsh\"" >> ~/.zshrc