#!/bin/bash

declare -r ROOT=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

link() {
  local source="$ROOT/$1"
  local target="$HOME/$2"

  if [ ! -f $target ]; then
    ln -s $source $target
  fi
}

is_installed() {
  which $1
}

is_platform() {
  [[ $OSTYPE == $1* ]]
}

if is_platform "darwin"; then
  if is_installed "brew"; then
    brew update
    brew upgrade
    brew cleanup -s --force
  else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew install "node"
  brew install "tig"
  brew install "tree"
  brew install "zsh"

  brewk cask install "atom"
  brewk cask install "discord"
  brewk cask install "google-chrome"
  brewk cask install "imagealpha"
  brewk cask install "imageoptim"
  brewk cask install "slack"
  brewk cask install "spectacle"
  brewk cask install "vlc"
fi

if is_installed "npm"; then
  npm install -g "npm@latest"
  npm install -g "diff-so-fancy"
  npm install -g "npm-check-updates"
fi

if is_installed "apm"; then
  apm install "docblockr"
  apm install "editorconfig"
  apm install "highlight-bad-chars"
  apm install "language-babel"
  apm install "language-diff"
  apm install "language-graphql"
fi

link "git/gitconfig" ".gitconfig"
link "git/gitexcludes" ".gitexcludes"
link "shell/inputrc" ".inputrc"
