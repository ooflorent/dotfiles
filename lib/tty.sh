_escape() {
  if [[ $TERM != "dumb" ]]; then
    echo "\033[${1}m"
  fi
}

_color_black()   { echo '0;30' ;}
_color_red()     { echo '0;31' ;}
_color_green()   { echo '0;32' ;}
_color_yellow()  { echo '0;33' ;}
_color_blue()    { echo '0;34' ;}
_color_magenta() { echo '0;35' ;}
_color_cyan()    { echo '0;36' ;}
_color_white()   { echo '0;37' ;}
_bold_black()    { echo '1;30' ;}
_bold_red()      { echo '1;31' ;}
_bold_green()    { echo '1;32' ;}
_bold_yellow()   { echo '1;33' ;}
_bold_blue()     { echo '1;34' ;}
_bold_magenta()  { echo '1;35' ;}
_bold_cyan()     { echo '1;36' ;}
_bold_white()    { echo '1;37' ;}

# Colors and modes
# ----------------

reset()     { echo -en "$(_escape 0)" ;}
color()     { echo -en "$(_escape $(_color_$1))" ;}
bold()      { echo -en "$(_escape $(_bold_$1))" ;}
underline() { echo -en "$(_escape 4)" ;}

# Output
# ------

e_header()  { echo -e "\n$(bold white)$@$(reset)" ;}
e_success() { echo -e " $(bold green)✔$(reset)  $@" ;}
e_warning() { echo -e " $(bold yellow)!$(reset)  $@" ;}
e_arrow()   { echo -e " $(bold yellow)➜$(reset)  $@" ;}
e_error()   { echo -e " $(bold red)✖$(reset)  $@" ;}
e_info()    { echo -e " $(bold cyan)?$(reset)  $@" ;}

e_status() {
  [ $1 -eq 0 ] \
    && e_success "$2" \
    || e_error "$2"
}

e_confirm() {
  printf "$@? (y/n) "
  read -n 1
  printf "\n"
}

e_prompt() {
  printf "$@ "
  read
}

# Input
# -----

yes? () { [[ "$REPLY" =~ ^[Yy]$ ]] ;}
answer() { echo -en "$REPLY" ;}
