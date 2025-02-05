#!/bin/sh

# Update the repo to head with latest repo
$(git submodule update --recursive --init)

# Install zsh setup
if [ -n $(which zsh) ]; then
   echo "Installing zsh setup"
   # Save original
   cp ~/.zshrc .zshrc.orig
   # install oh-my-zsh
   git_root=$(git rev-parse --show-toplevel)
   omz_root="${git_root}/.oh-my-zsh"
   RUNZSH=no CHSH=no ZSH="${omz_root}" sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
   # link powerlevel10k
   ln -sf "${git_root}/third-party/powerlevel10k/" "${omz_root}/custom/themes/powerlevel10k"
   # copy dotfiles
   cp .zshrc ~/.zshrc
   cp .p10k.zsh ~/.p10k.zsh
   cp "${git_root}/third-party/zsh-autosuggestions/zsh-autosuggestions.zsh" ~/.zsh-autosuggestions.zsh
fi

# Install bash setup
if [ -n $(which bash) ]; then
   echo "Installing bash setup"
   # Save original
   cp ~/.bashrc .bashrc.orig
   # install oh-my-bash
   OSH="${HOME}/.setup/.oh-my-bash" sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" --unattended
   # copy dotfiles
   cp .bashrc ~/.bashrc
fi

# Install vim setup
if [ -n $(which vim) ]; then
   echo "Installing vim setup"
   # Save original
   cp ~/.vimrc .vimrc.orig

   # copy dotfiles
   cp .vimrc ~/.vimrc
fi

# install fzf
./third-party/fzf/install --all
