#!/usr/bin/env bash

echo
echo "Running rust install script"

######################
# The rust toolchain #
######################

# https://www.rust-lang.org/tools/install
cargo --version > /dev/null
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
tldr --version > /dev/null
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

