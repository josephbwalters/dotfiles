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
echo 'Installing ruby v2.5.3'
rbenv install 2.5.3
echo 'Setting ruby v2.5.3 as global instance'
rbenv global 2.5.3 # system ruby is stupid
echo 'Installing bundler v2.1.4'
gem install bundler -v ‘2.1.4’
rbenv rehash # rerun this anytime you install new gems/ruby versions

echo 'Updating system gems'
gem update —system # something is being stupid so have to do this

install_cask_app 'google-chrome'
install_cask_app 'slack'
install_cask_app 'zoomus'
install_cask_app 'postman'
install_app 'the_silver_searcher'
install_app 'postgresql94'
install_cask_app 'pgadmin4'
install_cask_app 'iterm2'
install_cask_app 'visual-studio-code'
install_app 'neovim'
install_app 'git'
install_app 'autojump'
install_app 'tmux'
install_app 'task'
install_app 'timewarrior'

# Install node packages
npm install --global is-up-cli
echo 'Install of all other applications - COMPLETE!'

# Install Gems
gem install terjira

echo 'Installing ohmyzsh this will probably restart shell'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
rm ~/.zshrc # Remove .zshrc in favor for symlink
ln -s ~/Development/dotfiles/zsh/.zshrc .zshrc
