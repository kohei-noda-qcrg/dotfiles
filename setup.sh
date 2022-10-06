#!/usr/bin/env bash
set -euo pipefail

FILEPATH=$(cd "$(dirname "$0")" && pwd)
cd "$FILEPATH" || exit

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# z
mkdir -p "$HOME/z"
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O "$HOME/z/z.sh"


DOTFILES=(.vimrc .screenrc .bashrc)

for file in "${DOTFILES[@]}"
do
  ln -s "$FILEPATH/$file" "$HOME/$file"
done

# ~/.local/share/vim-lsp-settings/servers/pylsp-all/venv/bin/pip installl pylsp-mypy pylsp-black
