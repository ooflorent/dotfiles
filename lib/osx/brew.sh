_is_cask_installed() {
  if [ $(brew cask list "$1" &> /dev/null; printf $?) -eq 0 ]; then
    return 0
  fi
  return 1
}

_is_formulae_installed() {
  if [ $(brew list "$1" &> /dev/null; printf $?) -eq 0 ]; then
    return 0
  fi
  return 1
}

_is_repository_installed() {
  if [ $(brew tap | grep "$1" &> /dev/null; printf $?) -eq 0 ]; then
    return 0
  fi
  return 1
}

install_brew() {
  if ! type_exists "brew"; then
    printf '\n' | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    e_success "Homebrew"
  else
    e_arrow "Homebrew is already installed"
  fi
}

brew_tap() {
  local msg="tap $1"
  _is_repository_installed "$1" \
    && e_arrow "$msg" \
    || execute "brew tap $@" "$msg"
}

brew_install() {
  local msg="formula $1"
  _is_formulae_installed "$1" \
    && e_arrow "$msg" \
    || execute "brew install $@" "$msg"
}

brew_cask() {
  local msg="cask $1"
  _is_cask_installed "$1" \
    && e_arrow "$msg" \
    || execute "brew cask install $@" "$msg"
}
