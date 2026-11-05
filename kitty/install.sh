#!/usr/bin/env bash

echo
echo "Running kitty install script"

src_dir="$(cd "$(dirname "$0")" && pwd -P)"
dst_dir="$HOME/.config/kitty"
mkdir -p "$dst_dir"

# Files are linked individually, not the directory, because kitty writes
# generated files such as current-theme.conf next to its config. The theme needs
# its own link because kitty resolves includes relative to the symlink's location.
for name in kitty.conf everforest_dark_medium.conf
do
    src="$src_dir/$name"
    dst="$dst_dir/$name"

    if [[ -e "$dst" && ! -L "$dst" ]]
    then
        echo "Leaving $dst alone: it is a real file, not a link. Move it aside and re-run."
        exit 1
    fi

    ln -sfn "$src" "$dst"
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] Installed kitty %s to %s\n" "$name" "$dst"
done
