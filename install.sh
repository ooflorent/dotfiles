#!/bin/bash

DIR=$(pwd)

# Install dotfiles
ln -sf "$DIR/.aliases" "$HOME/.aliases"
ln -sf "$DIR/.editorconfig" "$HOME/.editorconfig"
ln -sf "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DIR/.gitignore" "$HOME/.gitignore"
ln -sf "$DIR/.zshrc" "$HOME/.zshrc"
