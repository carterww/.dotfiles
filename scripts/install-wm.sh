#!/bin/bash

REPO_PATH="$HOME/code/suckless"

IMG="/usr/share/pixmaps/default-background.jpg"

DWM_DIR="$REPO_PATH/dwm"
DWM_REPO="https://github.com/carterww/dwm.git"

SLSTATUS_DIR="$REPO_PATH/slstatus"
SLSTATUS_REPO="https://github.com/carterww/slstatus.git"

SLOCK_DIR="$REPO_PATH/slock"
SLOCK_REPO="https://github.com/carterww/slock.git"

echo "Installing dependencies using pacman"
# I think these are all but I could be missing some
# This includes EVERYTHING dwm uses that is hardcoded
pacman -Sy --noconfirm xorg-server xorg-apps libx11                 \
              ttf-roboto-mono-nerd ttf-font-awesome dmenu playerctl \
              picom feh xss-lock pulseaudio curl

if test -d $REPO_PATH; then
    echo "The suckless directory already exists in $REPO_PATH."
else
    mkdir -p $REPO_PATH
fi

# Clone my dwm and slstatus repos into my code directory
if test -d $DWM_DIR; then
    echo "dwm is already installed in $DWM_DIR."
else
    git clone --depth=1 $DWM_REPO $DWM_DIR
fi

if test -d $SLSTATUS_DIR; then
    echo "slstatus is already installed in $SLSTATUS_DIR."
else
    git clone --depth=1 $SLSTATUS_REPO $SLSTATUS_DIR
fi

if test -d $SLOCK_DIR; then
    echo "slock is already installed in $SLOCK_DIR."
else
    git clone --depth=1 $SLOCK_REPO $SLOCK_DIR
fi

echo "Compiling and installing dwm and slstatus."
if [[ $1 == *"i"* ]]; then
    make -C $DWM_DIR clean install
    make -C $SLSTATUS_DIR clean install
    make -C $SLOCK_DIR clean install
else
  echo "Not installing dwm, slstatus, or slock. Run 'make install' as root for each."
  echo "REMINDER: Be sure to define LAPTOP_BUILD in config.h if it's for my laptop."
fi

if test ! -f $IMG; then
  echo "Downloading a background I like to the hardcoded path I have in dwm."
  curl https://image4.uhdpaper.com/wallpaper/night-sky-stars-mountain-scenery-milky-way-uhdpaper.com-4K-4.751.jpg > $IMG
fi

entryStr="\
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession"

if test ! -f /usr/share/xsessions/dwm.desktop; then
  echo "Creating dwm.desktop file."
  echo $entryStr > /usr/share/xsessions/dwm.desktop
fi
