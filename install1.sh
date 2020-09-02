#!/bin/bash

# IMPORTANT!!!
# Before running make Development dir and put dotfiles repo there
echo 'Starting install...'
echo 'Installing xcode tools'
xcode-select -—install

echo 'Installing Homebrew'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Install system deps'
brew bundle
echo 'Install complete - please restart shell'
