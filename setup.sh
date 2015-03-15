#!/bin/sh

DOTFILES=( bin .zshrc .vim .vimrc .screenrc .gitconfig )

for file in ${DOTFILES[@]}
do
  ln -sn $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall
fi
