#!/usr/bin/env bash

echo
echo "Running ffmpeg install script"

ffmpeg -version > /dev/null
if [[ $? == 0 ]]
then
    echo "ffmpeg already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install ffmpeg 
        elif [[ "$distroName" == *"Mint"* ]]
        then
            echo "ffmpeg install not automated on Mint."
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        echo "ffmpeg install not automated on Mac."
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi
fi

