install_xcode() {
  if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
    xcode-select --install &> /dev/null
    # Wait until the XCode Command Line Tools are installed
    while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
      sleep 5
    done
    e_success "XCode Command Line Tools"
  else
    e_arrow "XCode Command Line Tools already installed"
  fi
}
