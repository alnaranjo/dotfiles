#!/bin/sh

# Creates symbolik links in HOME for all DOTFILES

DOTFILES=(
    ".tmux.conf"
    ".vimrc"
    ".zshrc"
)

for dotfile in "${DOTFILES[@]}"; do
    ln -sv "$PWD/$dotfile" ~
done
