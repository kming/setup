#!/bin/sh

# remove settings files
rm ~/.zshrc
rm ~/.p10k*
rm ~/.zsh-autosuggestions.zsh

# uninstall fzf
./third-party/fzf/uninstall

# uninstall oh-my-zsh
ZSH=~/.setup/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"
rm -rf .oh-my-zsh