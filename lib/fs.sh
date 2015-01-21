exists? () {
  [[ -f "$1" || -d "$1" || -L "$1" ]]
}

ln_s() {
  ln -s "$1" "$2" &> /dev/null
}

rm_f() {
  rm -f "$1" &> /dev/null
}
