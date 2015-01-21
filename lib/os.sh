# OS types
is_mac? () { [[ $OSTYPE == darwin* ]] ;}
is_linux? () { [[ $OSTYPE == linux-gnu ]] ;}

# Capabilities
has_command? () { [[ -n ${commands[$1]} ]] ;}

ask_for_sudo() {
  # Ask for the administrator password upfront
  sudo -v

  # Update existing `sudo` time stamp until this script has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}
