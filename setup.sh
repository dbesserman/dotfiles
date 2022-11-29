git clone git@github.com:dbesserman/dotfiles.git ~/Documents

chmod +x ~/Documents/dotfiles/tmux/tat
mkdir ~/bin

ln -s ~/Documents/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/Documents/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/Documents/dotfiles/tmux/tat ~/bin/tat
ln -s ~/Documents/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/Documents/dotfiles/helix ~/.config/helix
