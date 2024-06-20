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
      "--no-folding"
      "-v"
      "--adopt"
)

# Handle packs in the ~ dir
stow                        \
  -d ~/.dotfiles            \
  -t ~/                     \
  ${stowArgs[@]}            \
  -S root

stow                        \
  -d ~/.dotfiles            \
  -t ~/.oh-my-zsh           \
  ${stowArgs[@]}            \
  -S dot-oh-my-zsh

# Stow the .config
stow                        \
  -d ~/.dotfiles            \
  -t ~/.config              \
  ${stowArgs[@]}            \
  -S dot-config
