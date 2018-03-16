#!/bin/bash
xcode-select --install
# http://ss64.com/osx/syntax-defaults.html
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g WebContinuousSpellCheckingEnabled -bool false
defaults write -g WebAutomaticDashSubstitutionEnabled -bool false
defaults write -g WebAutomaticTextReplacementEnabled -bool false
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.google.Keystone.Agent checkInterval 0
defaults write com.apple.diskspaced minFreeSpace 4
defaults write com.apple.diskspaced freeSpaceWarningLevel 1
defaults write com.apple.diskspaced warningInterval 3600
launchctl stop com.apple.diskspaced
killall -STOP diskspaced
launchctl start com.apple.diskspaced
# https://www.java.com/ru/download/mac_download.jsp
# intellij - look for - Education keys for IDE(gmail)
# https://docs.docker.com/docker-for-mac/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade
brew cleanup
# brew tap Homebrew/bundle
brew bundle
# brew deps pkg
# brew uses --installed pkg
# brew list | while read cask; do echo -n $cask; brew deps "$cask  ->" | awk '{printf(" %s ", $0)}'; echo ""; done
sudo /usr/libexec/locate.updatedb
