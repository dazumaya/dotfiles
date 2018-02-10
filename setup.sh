#!/bin/sh

DOTFILES=( .zprofile .zshrc .vim .vimrc .screenrc .gitconfig )
for file in ${DOTFILES[@]}
do
  ln -sfn $PWD/$file $HOME/$file
done

mkdir -p $HOME/bin
BIN=( git_diff_wrapper pero )
for file in ${BIN[@]}
do
  ln -sfn $PWD/bin/$file $HOME/bin/$file
done

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle && git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall
fi
