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
        distroName="$(grep "^NAME=" /etc/os-release)"
	if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install zsh 
        elif [[ "$distroName" == *"Mint"* ]]
        then
            sudo apt-get install zsh
	else
            echo "Unknown Linux distribution: $distroName"
	    exit 1
	fi
    elif [[ $unameOut == "Darwin" ]]
    then
        brew install zsh
    else
        echo "Unknown kernel: $unameOut"
	exit 1
    fi
fi
chsh -s $(which zsh)

