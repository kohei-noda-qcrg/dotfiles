#!/usr/bin/env bash

FILEPATH=$(cd "$(dirname "$0")" && pwd)
DOTFILES=(.vimrc .screenrc)

for file in ${DOTFILES[@]}
do
  ln -s $FILEPATH/$file $HOME/$file
done
