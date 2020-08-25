#!/bin/bash

# set all configs for bash, tmux, vim, nvim and ideavim
mkdir -p ~/.config/nvim
mkdir -p ~/tmp

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux ~/.tmux
tmux source-file ~/.tmux.conf # start nord theme for tmux
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/global-gitignore ~/.gitignore

# install all plugins for vim
vim +PluginInstall +qall
