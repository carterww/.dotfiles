#!/bin/bash

echo "Installing dependencies with pacman"
pacman -Sy --noconfirm sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg

defaultConfigPath="/usr/lib/sddm/sddm.conf.d/default.conf"
userConfigPath="/etc/sddm.conf"

if test -f "$userConfigPath"; then
    echo "$userConfigPath exists."
else
    echo "$userConfigPath does not exist."
    echo "Copying default sddm config file to /etc/sddm.conf"
    cp $defaultConfigPath $userConfigPath
fi

echo "Creating sddm config file at /etc/sddm.conf"


echo "Enabling sddm"
systemctl enable sddm

echo "Download the sugar candy theme from https://www.opendesktop.org/p/1312658 and follow these instructions https://framagit.org/MarianArlt/sddm-sugar-candy#from-other-desktop-environments"
