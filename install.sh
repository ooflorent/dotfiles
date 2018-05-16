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

_link "$DIR/git/gitconfig" "$HOME/.gitconfig"
_link "$DIR/git/gitexcludes" "$HOME/.gitexcludes"
_link "$DIR/ssh/config" "$HOME/.ssh/config"
_link "$DIR/zsh/zshrc" "$HOME/.zshrc"

# brew bundle install

# echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
# chsh -s /usr/local/bin/zsh
