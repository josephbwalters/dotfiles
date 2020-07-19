echo 'Installing ohmyzsh this will probably restart shell'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
rm ~/.zshrc # Remove .zshrc in favor for symlink
ln -s ~/Development/dotfiles/zsh/.zshrc .zshrc
