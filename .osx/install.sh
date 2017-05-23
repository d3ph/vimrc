#!/bin/bash
xcode-select --install
# http://ss64.com/osx/syntax-defaults.html
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g WebContinuousSpellCheckingEnabled -bool false
defaults write -g WebAutomaticDashSubstitutionEnabled -bool false
defaults write -g WebAutomaticTextReplacementEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.google.Keystone.Agent checkInterval 0
# https://www.java.com/ru/download/mac_download.jsp
# intellij - look for - Education keys for IDE(gmail)
# https://docs.docker.com/docker-for-mac/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade
brew bundle
sudo /usr/libexec/locate.updatedb
