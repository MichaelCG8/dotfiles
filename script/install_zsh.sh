#! /usr/bin/env bash

# Install zsh if it is not already.
zsh --version > /dev/null
if [[ $? == 0 ]]
then
    echo "zsh already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        sudo apt-get install zsh
    elif [[ $unameOut == "Darwin" ]]
    then
        brew install zsh
    else
        echo "Unknown kernel: $unameOut"
	exit 1
    fi
fi
chsh -s $(which zsh)

