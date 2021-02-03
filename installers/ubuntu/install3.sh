# TODO: prompt node version
echo 'nvm setup!'
nvm install --lts

echo 'rbenv setup!'
rbenv init
# TODO prompt ruby version
rbenv install 3.0.0
rbenv global 3.0.0
rbenv rehash
gem update 
gem install bundler
rbenv rehash
