#!/bin/bash

function install_app() {
    echo "Installing $1"; brew install $1;
}

function install_cask_app() {
    echo "Installing $1"; brew cask install $1;
}

# IMPORTANT!!!
# Before running make Development dir and put dotfiles repo there
echo 'Starting install install...'
echo 'Installing xcode tools'
xcode-select -—install

ln -s ~/Development/dotfiles/nvim/init.vim .config/nvim/init.vim

echo 'Installing Homebrew'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install_app 'nvm'
echo 'Installing NodeJS v11.7.0'
nvm install v11.7.0
install_app 'yarn'

echo 'Setting up rbenv'
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

echo 'Updating system gems'
gem update —system # something is being stupid so have to do this

install_cask_app 'google-chrome'
install_cask_app 'brave-browser'
install_cask_app 'firefox-developer-edition'
install_cask_app 'slack'
install_cask_app 'zoomus'
install_cask_app 'postman'
install_app 'the_silver_searcher'
install_cask_app 'pgadmin4'
install_cask_app 'iterm2'
install_cask_app 'jetbrains-toolbox'
install_app 'neovim'
install_app 'git'
install_app 'autojump'
install_app 'tmux'
install_app 'task'
install_app 'timewarrior'
install_app 'stow'

# I switched back to vim so hiding vscode ;)
# install_cask_app 'visual-studio-code'

# Postgres Install
install_app 'postgresql'
echo 'Setting up PostgreSQL'
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@9.6/bin:$PATH"' >> ~/.profile
echo 'Starting service or postgres - will always run on login/restart';
brew services start postgresql

# Install node packages
npm install --global is-up-cli
echo 'Install of all other applications - COMPLETE!'

# Install Gems
gem install terjira


echo 'Installing ruby v2.5.3'
rbenv install 2.5.3
echo 'Setting ruby v2.5.3 as global instance'
rbenv global 2.5.3 # system ruby is stupid
echo 'Installing bundler v2.1.4'
gem install bundler -v ‘2.1.4’
rbenv rehash # rerun this anytime you install new gems/ruby versions


