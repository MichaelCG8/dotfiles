#!/bin/bash

gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

echo "This setting will take effect after the next reboot. Do you want to reboot now? [y/N]"
read answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    echo "Restarting the computer..."
    sudo reboot
else
    echo "Exiting without restarting."
fi
