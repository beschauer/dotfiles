#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
# brew tap caskroom/versions

# daily
brew install --cask rectangle
brew install --cask karabiner-elements

# dev
brew install --cask iterm2
brew install --cask kube-forwarder

# browsers
brew install --cask google-chrome
brew install --cask firefox


# misc
brew install --cask keka


# Not on cask but I want regardless.

