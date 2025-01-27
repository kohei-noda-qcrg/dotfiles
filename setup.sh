#!/usr/bin/env bash
set -euo pipefail

FILEPATH=$(cd "$(dirname "$0")" && pwd)
pushd "$FILEPATH" || exit

DOTFILES=($(find . -maxdepth 1 -type f | grep "^\./\."))  # Find all dotfiles in the current directory

for file in "${DOTFILES[@]}"
do
  echo $file
  if [ "$file" == "./.gitignore" ]; then
    continue
  elif [ "$file" == "./.bashrc" ]; then
    cat $file >> $HOME/.bashrc
    continue
  fi
  ln -sf "$FILEPATH/$file" "$HOME/$file"
done

# ~/.local/share/vim-lsp-settings/servers/pylsp-all/venv/bin/pip installl pylsp-mypy pylsp-black
