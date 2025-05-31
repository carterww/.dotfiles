#!/bin/bash
# This scripts creates sym links for all the files in the current directory.
# The dot files will be linked to the home directory.

if test -f ~/.zshrc; then
  echo "Backing up existing .zshrc to .zshrc.bak"
  mv ~/.zshrc ~/.zshrc.bak
fi

if [[ "$SHELL" != *"zsh"* ]]; then
  echo "Setting zsh as default shell"
  chsh -s $(which zsh)
fi

stowArgs=(
      "--dotfiles"
      "-v"
      "--adopt"
)

# Create the directories
mkdir -p ~/.config

# Handle packs in the ~ dir
stow                        \
  -d ~/.dotfiles            \
  -t ~                      \
  ${stowArgs[@]}            \
  -S root

# Stow the .config
stow                        \
  -d ~/.dotfiles            \
  -t ~/.config              \
  ${stowArgs[@]}            \
  -S dot-config

# Make the scripts executable
for i in ~/.dotfiles/scripts/*.sh; do
  [ -f "$i" ] || break
  chmod +x $i
done
