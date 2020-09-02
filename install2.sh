# I haven't solved problem of reloading shell

echo 'Install versions (py, rb, node, etc.)'

nvm install v11.7.0
# TODO: Symlink package.json
yarn install  -g ~/Development/dotfiles/package.json
 
pyenv install 3.8.3
pyenv global 3.8.3
# TODO: Symlink requirements.txt
pip install -r ~/Development/dotfiles/requirements.txt

rbenv init
rbenv install 2.5.3
rbenv global 2.5.3 # system ruby is stupid
gem update —system
gem install bundler
bundle install --gemfile="~/Development/dotfiles/Gemfile"
rbenv rehash

# Postgres Install
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@9.6/bin:$PATH"' >> ~/.profile
echo 'Starting service or postgres - will always run on login/restart';
brew services start postgresql
echo 'Installing ruby and bundler'

echo 'Installing ohmyzsh this will probably restart shell'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

