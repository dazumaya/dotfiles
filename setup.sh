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

if [ ! -f ~/bin/ack ]; then
  curl https://beyondgrep.com/ack-2.22-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
fi

if [ ! -f ~/.zplug/init.zsh ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +q +q
  vim +GoInstallBinaries +q +q
fi
