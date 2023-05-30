#!/bin/sh

# install oh-my-zsh
ZSH=~/.setup/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"
rm -rf .oh-my-zsh

# install fzf
./third-party/fzf/uninstall

rm ~/.zshrc

