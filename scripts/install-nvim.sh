#!/bin/bash

localShare="${XDG_DATA_HOME:-$HOME/.local/share}"

echo "Installing dependencies using pacman"
pacman -Sy --noconfirm neovim git tree-sitter-cli xclip

if test -d $localShare/nvim/site/pack/paqs/start/paq-nvim; then
    echo "paq-nvim is already installed. Update it with :PaqUpdate in nvim."
    exit 0
fi

echo "Installing paq-nvim"
# Clone paq
git clone --depth=1 https://github.com/savq/paq-nvim.git \
     $localShare/nvim/site/pack/paqs/start/paq-nvim

echo "paq-nvim installed. Run :PaqInstall in nvim to install plugins."
