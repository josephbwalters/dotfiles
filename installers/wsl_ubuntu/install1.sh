# ZSH install
sudo apt install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to path
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/jwalters/.zprofile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Install packages
brew bundle

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# RESTART
nvm install --lts # you may want to change version

apt-get install -y zlib1g-dev
rbenv init
rbenv install 3.0.0 # you may want to change version
rbenv global 3.0.0 # you may want to change version
gem update 
gem install bundler
rbenv rehash
