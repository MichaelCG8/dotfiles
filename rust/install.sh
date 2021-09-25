#!/usr/bin/env bash

######################
# The rust toolchain #
######################

# https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

###################
# Useful binaries #
###################

# Rust implementation of tldr
# https://github.com/tldr-pages/tldr
# https://crates.io/crates/tealdeer
unameOut="$(uname -s)"
if [[ $unameOut == "Linux" ]] then
    sudo apt-get install libssl-dev
elif [[ $unameOut == "Darwin" ]] then
    brew install openssl
else
    echo "Unknown kernel: $unameOut"
    exit 1
fi

cargo install tealdeer

