#!/bin/sh

DOTFILES=( bin .zshrc .vim .vimrc .screenrc .gitconfig )

for file in ${DOTFILES[@]}
do
  ln -sn $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d ~/.vim/bundle/vundle ]; then
  mkdir -p ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim -c ':BundleInstall'
fi
