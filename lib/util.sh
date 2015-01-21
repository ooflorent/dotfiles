is_osx() {
  [[ "$(uname -s)" = "Darwin" ]]
}

is_debian() {
  [[ "$(uname -s)" = "Linux" && "$(lsb_release -si)" = "Debian" ]]
}

e_header() {
  echo -e "\n\033[1m$@\033[0m"
}

e_success() {
  echo -e " \033[1;32m✔\033[0m  $@"
}

e_error() {
  echo -e " \033[1;31m✖\033[0m  $@"
}

e_arrow() {
  echo -e " \033[1;33m➜\033[0m  $@"
}

e_result() {
  [ $1 -eq 0 ] \
    && e_success "$2" \
    || e_error "$2"
}

execute() {
  $1 &> /dev/null
  e_result $? "${2:-$1}"
}

ask_confirmation() {
  printf "\n"
  print_warning "$@"
  read -p "Continue? (y/n) " -n 1
  printf "\n"
}

is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

type_exists() {
  if [ $(type -P $1) ]; then
    return 0
  fi
  return 1
}