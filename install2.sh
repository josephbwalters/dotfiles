
echo 'Installing ruby v2.5.3'
rbenv install 2.5.3
echo 'Setting ruby v2.5.3 as global instance'
rbenv global 2.5.3 # system ruby is stupid
echo 'Installing bundler v2.1.4'
gem install bundler -v ‘2.1.4’
rbenv rehash # rerun this anytime you install new gems/ruby versions

echo 'Installing ohmyzsh this will probably restart shell'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


