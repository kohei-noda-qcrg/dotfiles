# xdg env
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_PICTURES_DIR="$HOME/.local/documents/pictures"
# env variables
export GIT_PS1_SHOWDIRTYSTATE=1
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export EDITOR=nvim
export COLORTERM=truecolor

# source
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"         # rust
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env" # uv
[ -f "/usr/share/bash-completion/bash_completion" ] && . "/usr/share/bash-completion/bash_completion"
if type zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then . "$HOME/.bashrc"; fi
fi
