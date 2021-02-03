apt install -y build-essential
apt install -y zlib1g-dev
apt install -y htop
apt install -y neofetch
apt install -y fzf
apt install -y neovim
apt install -y curl
# apt install -y rbenv
apt install -y ripgrep
apt install -y tldr
apt install -y autojump
apt install -y python3-venv
apt install -y stow
apt install -y silversearcher-ag
apt install -y thefuck
apt install -y postgresql
apt install -y zsh
apt install -y fonts-firacode

# Install brew
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/jwalters/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install rbenv

# Install Chrome Browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install VSCode
sudo snap install --classic code # or code-insiders

# Installs nvm
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
brew install nvm
mkdir ~/.nvm
brew install yarn

# Installs oh-my-zsh
chsh -s $(which zsh) 
echo 'Please restart shell after oh-my-zsh loads, then run install2.sh'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# after zsh loads, restart shell and run install2.sh
