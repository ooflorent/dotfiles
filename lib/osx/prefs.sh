set_dock_prefs() {
  # Automatically hide or show the Dock
  defaults write com.apple.dock autohide -bool true

  # Speed up Mission Control animations
  defaults write com.apple.dock expose-animation-duration -float 0.1

  # Don’t group windows by application in Mission Control
  defaults write com.apple.dock expose-group-by-app -bool false

  # Change minimize/maximize window effect
  defaults write com.apple.dock mineffect -string "scale"
}

set_language_prefs() {
  # Set language and text formats
  defaults write NSGlobalDomain AppleLanguages -array "en" "fr"
  defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
  defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
  defaults write NSGlobalDomain AppleMetricUnits -bool true

  # Set the timezone
  sudo systemsetup -settimezone "Europe/Paris" > /dev/null

  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
}

set_iterm2_prefs() {
  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false
}

set_terminal_prefs() {
  # Only use UTF-8 in Terminal.app
  defaults write com.apple.terminal StringEncodings -array 4
}

set_textedit_prefs() {
  # Open and save files as UTF-8 encoded
  defaults write com.apple.TextEdit PlainTextEncoding -int 4
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

  # Use plain text mode for new documents
  defaults write com.apple.TextEdit RichText -int 0
}

set_keyboard_prefs() {
  # Enable full keyboard access for all controls
  # (e.g. enable Tab in modal dialogs)
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # Disable press-and-hold for keys in favor of key repeat
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Delay Until Repeat
  defaults write NSGlobalDomain "InitialKeyRepeat_Level_Saved" -int 15

  # Set the key repeat rate to fast
  defaults write NSGlobalDomain KeyRepeat -int 2

  # Disable smart quotes
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

  # Disable smart dashes
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
}

set_trackpad_prefs() {
  # Enable `Tap to click`
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

  # Disable natural scrolling
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
}

force_apply() {
  for i in "cfprefsd" "Dock" "Finder" "SystemUIServer" "TextEdit"; do
    killall "$i" &> /dev/null
  done
}
