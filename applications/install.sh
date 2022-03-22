#!/usr/bin/env bash

echo
echo "Running applications install script"

which ffmpeg > /dev/null
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

which vlc > /dev/null
if [[ $? == 0 ]]
then
    echo "vlc already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install vlc 
        elif [[ "$distroName" == *"Mint"* ]]
        then
            echo "vlc install not automated on Mint."
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        echo "vlc install not automated on Mac."
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi
fi


which steam > /dev/null
if [[ $? == 0 ]]
then
    echo "Steam already installed"
else
    read -n1 -p "Do you want to install Steam for gaming? [y,n]" doit 
    case $doit in  
      y|Y)
        unameOut="$(uname -s)"
        if [[ $unameOut == "Linux" ]]
        then
            distroName="$(grep "^NAME=" /etc/os-release)"
            if [[ "$distroName" == *"Fedora"* ]]
            then
                sudo dnf install steam
            elif [[ "$distroName" == *"Mint"* ]]
            then
                sudo apt-get install steam
            else
                echo "Unknown Linux distribution: $distroName"
                exit 1
            fi
        elif [[ $unameOut == "Darwin" ]]
        then
            echo "Steam install unsupported on Mac"
        else
            echo "Unknown kernel: $unameOut"
            exit 1
        fi	
	;; 
      *) echo Skipping Steam install ;; 
    esac
fi


which inkscape > /dev/null
if [[ $? == 0 ]]
then
    echo "Inkscape already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install inkscape
        elif [[ "$distroName" == *"Mint"* ]]
        then
	    echo "Inkscape install not automated on Mint"
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        brew install --cask inkscape
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi	
fi


which thunderbird > /dev/null
if [[ $? == 0 ]]
then
    echo "Thunderbird already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install thunderbird
        elif [[ "$distroName" == *"Mint"* ]]
        then
	    echo "Thunderbird install not automated on Mint"
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        echo "Thunderbird install not automated on Mac"
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi	
fi


which gimp > /dev/null
if [[ $? == 0 ]]
then
    echo "GIMP already installed"
else
    unameOut="$(uname -s)"
    if [[ $unameOut == "Linux" ]]
    then
        distroName="$(grep "^NAME=" /etc/os-release)"
        if [[ "$distroName" == *"Fedora"* ]]
        then
            sudo dnf install gimp
        elif [[ "$distroName" == *"Mint"* ]]
        then
	    echo "GIMP install not automated on Mint"
        else
            echo "Unknown Linux distribution: $distroName"
            exit 1
        fi
    elif [[ $unameOut == "Darwin" ]]
    then
        echo "GIMP install not automated on Mac"
    else
        echo "Unknown kernel: $unameOut"
        exit 1
    fi	
fi

