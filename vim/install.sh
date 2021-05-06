#!/usr/bin/env bash

# Install vim-plug.
# https://github.com/junegunn/vim-plug
# Removed -L from curl options to disallow redirects.
curl -fo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

