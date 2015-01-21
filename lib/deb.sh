package_install() {
  local msg="package $1"
  type_exists "$1" \
    && e_arrow "$msg" \
    || execute "sudo apt-get install --allow-unauthenticated -qqy $1" "$msg"
}
