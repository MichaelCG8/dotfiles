#!/usr/bin/env bash

echo
echo "Running kitty install script"

src="$(cd "$(dirname "$0")" && pwd -P)/kitty.conf"
dst="$HOME/.config/kitty/kitty.conf"

# Only the file is linked, not the directory, because kitty writes generated
# files such as current-theme.conf next to its config.
if [[ -e "$dst" && ! -L "$dst" ]]
then
    echo "Leaving $dst alone: it is a real file, not a link. Move it aside and re-run."
    exit 1
fi

mkdir -p "$(dirname "$dst")"
ln -sfn "$src" "$dst"
printf "\r\033[2K  [ \033[00;32mOK\033[0m ] Installed kitty config to %s\n" "$dst"
