export readonly _PROGNAME=$(basename $0)
export readonly _PROGDIR=$(cd "$(dirname $0)" && pwd)
export readonly _ARGS="$@"

declare FORCE=1
declare INTERACTIVE=1

# Program informations
# --------------------

progname() {
  echo "$_PROGNAME"
}

progdir() {
  echo "$_PROGDIR"
}

args() {
  echo "$_ARGS"
}

# Dot core
# --------

dot_lib() {
  source "$(progdir)/lib/$1.sh" || exit 1
}

dot_run() {
  local defs=$1

  dot_opts $(args)
  $defs
}

dot_lib "fs"
dot_lib "os"
dot_lib "tty"
dot_lib "mac"

dot_usage() {
  cat <<EOF
Usage: $(progname) [options]

Options:
  -f  override existing files
  -i  prompt before every group
  -h  show this help
EOF
}

dot_opts() {
  while getopts "fih" OPTION; do
    case $OPTION in
      f) FORCE=0 ;;
      i) INTERACTIVE=0 ;;
      h) dot_usage; exit ;;
      ?) dot_usage; exit ;;
    esac
  done
}

# Definition framework
# --------------------

group() {
  local name=$1
  local defs=$2

  e_header "$name"

  if [ $INTERACTIVE -eq 0 ]; then
    e_confirm "Continue"
    if yes?; then
      $defs
    fi
  else
    $defs
  fi
}

subgroup() {
  local name=$1
  local defs=$2

  $($defs &> /dev/null)
  e_status $? "$name"
}

link() {
  local src="$(progdir)/$1"
  local dst

  if [ -z "$2" ]; then
    dst="$HOME/.$(basename $1)"
  else
    dst="$HOME/$2"
  fi

  if [ $FORCE -eq 0 ]; then
    rm_f "$dst"
  fi

  ln_s "$src" "$dst"
  e_status $? "$1 $(bold white)→$(reset) $dst"
}
