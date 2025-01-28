#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
LINK_DIR="$SCRIPT_DIR/link"

all_files=$(find "$LINK_DIR" -type f)
for file in $all_files; do
  relative_path=${file#"$LINK_DIR"/}
  echo "ln -sf $file $HOME/$relative_path"
  ln -sf "$file" "$HOME/$relative_path"
done

# ~/.local/share/vim-lsp-settings/servers/pylsp-all/venv/bin/pip installl pylsp-mypy pylsp-black
