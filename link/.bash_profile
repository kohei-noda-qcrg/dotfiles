# env variables
export GIT_PS1_SHOWDIRTYSTATE=1
export VOLTA_HOME="$HOME/.volta"
export PATH="$HOME/bin:$VOLTA_HOME/bin:$PATH"
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim

# source
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env" # rust
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env" # uv

if [ -n "$BASH_VERSION" ]; then
	if [ -f "$HOME/.bashrc" ]; then . "$HOME/.bashrc"; fi
fi
