#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors
wget https://github.com/iaunn/my-vim/raw/master/vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night.vim -O ~/.vim/colors/Tomorrow-Night.vim
