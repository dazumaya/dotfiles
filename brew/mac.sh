#!/bin/sh

case "${OSTYPE}" in
  darwin*)
  if [ ! -f /usr/local/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew bundle
  fi
  ;;
esac
