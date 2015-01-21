_is_application_installed? () {
  brew cask list "$1" &> /dev/null
}

_is_formula_installed? () {
  brew list "$1" &> /dev/null
}

_is_repository_tapped? () {
  brew tap | grep "$1" &> /dev/null
}

_run_brew() {
  local is_installed=$1
  shift

  local name=$2
  local cmd="brew $@"

  $is_installed "$name"

  if [ $? -ne 0 ]; then
    $("$cmd" &> /dev/null)
    e_status $? "$cmd"
  else
    e_arrow "$cmd"
  fi
}

brew_install() {
  _run_brew _is_formula_installed? "install" "$@"
}

brew_tap() {
  _run_brew _is_repository_tapped? "tap" "$@"
}

cask_install() {
  _run_brew _is_application_installed? "cask install" "$@"
}
