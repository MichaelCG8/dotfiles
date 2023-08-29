#!/usr/bin/env bash

echo
echo "Running rust install script"

######################
# The rust toolchain #
######################

# https://www.rust-lang.org/tools/install
which cargo > /dev/null 2>&1
if [[ $? == 0 ]]
then
    echo "rust already installed"
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

source $HOME/.cargo/env

###################
# Useful binaries #
###################

# Rust implementation of tldr
# https://github.com/tldr-pages/tldr
# https://crates.io/crates/tealdeer
which tldr > /dev/null 2>&1
if [[ $? == 0 ]]
then
    echo "tldr already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            echo "No tldr dependencies on Fedora"
        elif [[ "$distroName" == *"Mint"* ]]
        then
    	    sudo apt-get install libssl-dev
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        brew install openssl
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi

    cargo install tealdeer
fi

# User friendly implementation of du.
which dust > /dev/null 2>&1
if [[ $? == 0 ]]
then
    echo "dust already installed"
else
    cargo install du-dust
fi


which bat > /dev/null 2>&1
if [[ $? == 0 ]]
then
    echo "bat already installed"
else
    cargo install --locked bat
fi
