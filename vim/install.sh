#!/usr/bin/env bash

echo
echo "Running vim install script"

which vim > /dev/null
if [[ $? == 0 ]]
then
    echo "vim already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install vim
        elif [[ "$distroName" == *"Mint"* ]]
        then
            sudo apt-get install vim
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        brew install vim
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi
fi

# Install vim-plug.
# https://github.com/junegunn/vim-plug
# Removed -L from curl options to disallow redirects.
curl -fo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

