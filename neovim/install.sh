#!/usr/bin/env bash

echo
echo "Running neovim install script"

which nvim > /dev/null
if [[ $? == 0 ]]
then
    echo "neovim already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install neovim python3-neovim
        elif [[ "$distroName" == *"Mint"* ]]
        then
            sudo apt install neovim python3-neovim
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        brew install neovim
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi
fi


success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}


# Install config
config_dir="$HOME/.config"
mkdir -p "$config_dir"
src="$ZSH/neovim/config.symlink"
dst="$config_dir/nvim"
ln -sf "$src" "$dst"
success "Installed neovim config to $dst"
