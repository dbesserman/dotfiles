mkdir -p ~/.config/nvim
cp ~/Documents/dotfiles/vim/init.vim ~/.config/nvim/init.vim
mkdir -p ~/.vim/colors
cp ~/Documents/dotfiles/vim/dracula.vim ~/.vim/colors/dracula.vim

cp ~/Documents/dotfiles/git/gitconfig ~/.gitconfig

cp ~/Documents/dotfiles/tmux/tmux.conf ~/.tmux.conf
chmod +x ~/Documents/dotfiles/tmux/tat
mkdir ~/bin
ln -s ~/Documents/dotfiles/tmux/tat ~/bin/tat

echo "source ~/Documents/dotfiles/zsh/zshrc_complement.zsh" >> ~/.zshrc

defaults write -g ApplePressAndHoldEnabled -bool true
