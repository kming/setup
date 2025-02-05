#!/bin/sh

# Uninstall zsh setup
if [ -n $(which zsh) ]; then
    echo "Uninstalling zsh setup"
    # remove settings files
    rm ~/.zshrc
    rm ~/.p10k*
    rm ~/.zsh-autosuggestions.zsh
    # uninstall oh-my-zsh
    ZSH=~/.setup/.oh-my-zsh sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"
    rm -rf .oh-my-zsh
    # If original exists, restore
    if [ -f .zshrc.orig ]; then
        cp .zshrc.orig ~/.zshrc
    fi
fi

# Uninstall bash setup
if [ -n $(which bash) ]; then
    echo "Uninstalling bash setup"
    # remove settings files
    rm ~/.bashrc
    # uninstall oh-my-bash
    OSH="$HOME/.setup/.oh-my-bash" bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/uninstall.sh)"
    rm -rf .oh-my-bash
    # If original exists, restore
    if [ -f .bashrc.orig ]; then
        cp .bashrc.orig ~/.bashrc
    fi
fi

# Uninstall vim setup
if [ -n $(which vim) ]; then
    echo "Uninstalling vim setup"
    # remove settings files
    rm ~/.vimrc
    # If original exists, restore
    if [ -f .vimrc.orig ]; then
        cp .vimrc.orig ~/.vimrc
    fi
fi

# uninstall fzf
./third-party/fzf/uninstall
