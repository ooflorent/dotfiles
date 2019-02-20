#!/bin/bash

DIR=$(pwd)

_link() {
  local source=$1
  local target=$2
  if [ ! -f $target ]; then
    mkdir -p "$(dirname $target)"
    ln -s $source $target
  fi
}

ln -sf "$DIR/.editorconfig" "$HOME/.editorconfig"
ln -sf "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DIR/.gitignore" "$HOME/.gitignore"
ln -sf "$DIR/.zshrc" "$HOME/.zshrc"

# brew bundle install

# echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
# chsh -s /usr/local/bin/zsh
