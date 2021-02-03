# I haven't solved problem of reloading shell

echo 'Install p10k'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'Symlink configs'
rm ~/.zshrc # Remove .zshrc in favor for symlink
# rm ~/.config/nvim/init.vim # Remove init.vim in favor for symlink
mkdir ~/.config/nvim

# dotfiles repo needs to stay in root for now!
ln -s ~/dotfiles/configs/apps/zsh/linux/.zshrc ~/.zshrc
ln -s ~/dotfiles/configs/apps/nvim/init.vim ~/.config/nvim/init.vim
