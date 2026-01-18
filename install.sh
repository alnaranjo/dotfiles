#!/bin/sh

# Creates symbolik links in HOME for all DOTFILES

DOTFILES=(
    #".zshrc"
    ".bashrc"
)

for dotfile in "${DOTFILES[@]}"; do
    ln -sv "$PWD/$dotfile" ~
done
