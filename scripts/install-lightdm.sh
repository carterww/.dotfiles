#!/bin/bash

echo "Installing dependencies using pacman"
pacman -Sy --noconfirm lightdm lightdm-gtk-greeter

echo "Installing dracula theme with yay"
yay -S --noconfirm dracula-gtk-theme

echo "Setting up lightdm"
systemctl enable lightdm.service

echo "Setting up lightdm-gtk-greeter"

# This is in priv area, too lazy to use stow
gtkGreeterConf="\
[greeter]
icon-theme-name = Adwaita
font-name = BlexMono Nerd Font 13
xft-antialias = true
xft-rgba = rgb
xft-hintstyle = hintnone
background = /usr/share/pixmaps/default-background.jpg
default-user-image = /usr/share/pixmaps/lightdm-user.jpg
clock-format = %a, %h %d  %l:%M:%S
theme-name = Dracula
"

echo "$gtkGreeterConf" > /etc/lightdm/lightdm-gtk-greeter.conf

echo "REMINDER: Either add default-background.jpg and lightdm-user.jpg to /usr/share/pixmaps or change the paths in /etc/lightdm/lightdm-gtk-greeter.conf"
