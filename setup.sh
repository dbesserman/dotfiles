mkdir -p ~/.config/nvim
cp ~/Documents/dotfiles/vim/init.lua ~/.config/nvim/init.lua

cp ~/Documents/dotfiles/git/gitconfig ~/.gitconfig

cp ~/Documents/dotfiles/tmux/tmux.conf ~/.tmux.conf
chmod +x ~/Documents/dotfiles/tmux/tat
mkdir ~/bin
ln -s ~/Documents/dotfiles/tmux/tat ~/bin/tat

echo "source ~/Documents/dotfiles/zsh/zshrc_complement.zsh" >> ~/.zshrc

defaults write -g ApplePressAndHoldEnabled -bool true
