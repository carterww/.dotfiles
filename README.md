# .dotfiles
My dotfiles for various applications I spent time customizing.
## Installing
Execute link.sh to create symlinks to all the files with GNU stow. The --adopt flag is used by default, so it will merge the existing dot files with these. For adding new dotfiles, this is great, but this creates problems with conflicting dotfiles.
## Scripts
There are a few scripts to make setting up a new machine easier. These scripts install dependencies with pacman. I still need to test if they work.
1. Window Manager
2. Lightdm
3. Terminal Environment
4. Neovim
