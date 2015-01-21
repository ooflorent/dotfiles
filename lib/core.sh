link() {
  local src="$DOTFILES_DIRECTORY/$1"
  local dst

  if [ -z "$2" ]; then
    dst="$HOME/.$(basename $1)"
  else
    dst="$HOME/$2"
  fi

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
    e_arrow "$1"
  else
    execute "ln -fs $src $dst" "$1 → $dst"
  fi
}

ask_for_sudo() {
  # Ask for the administrator password upfront
  sudo -v

  # Update existing `sudo` time stamp until this script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}
