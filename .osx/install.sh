#!/bin/bash
xcode-select --install
defaults write -g ApplePressAndHoldEnabled -bool false
# https://www.java.com/ru/download/mac_download.jsp
# intellij
# https://docs.docker.com/docker-for-mac/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade
brew bundle
