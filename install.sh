#!/bin/sh

# Creates symbolik links in HOME for all DOTFILES

DOTFILES=(
    ".zshrc"
    #".bashrc"
    ".tmux.conf"
)

for dotfile in "${DOTFILES[@]}"; do
    ln -sv "$PWD/$dotfile" ~
done
