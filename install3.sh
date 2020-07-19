echo 'Get p10k'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'Remove zshrc'
rm ~/.zshrc # Remove .zshrc in favor for symlink
# rm ~/.config/nvim/init.vim # Remove init.vim in favor for symlink
echo 'Make nvim conf'
mkdir ~/.config/nvim
echo 'symlink zshrc'
ln -s ~/Development/dotfiles/zsh/.zshrc ~/.zshrc
echo 'symlink vim config'
ln -s ~/Development/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
