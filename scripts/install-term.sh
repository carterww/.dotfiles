#!/bin/bash

FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip"

echo "Installing dependencies using pacman"
pacman -Sy --noconfirm tmux xclip unzip ttf-hack-nerd

TERM_PACK="rxvt-unicode-truecolor-wide-glyphs"
echo "Installing $TERM_PACK with yay"
yay -S --noconfirm $TERM_PACK

echo "Downloading nerd font"
curl -L $FONT_URL > /tmp/IBMPlexMono.zip
unzip /tmp/IBMPlexMono.zip -d /usr/share/fonts
rm -f /usr/share/fonts/LICENSE.txt /usr/share/fonts/README.md /tmp/IBMPlexMono.zip

echo "Updating font cache"
fc-cache -f
