# env variables
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] $\[\033[00m\] '
export VOLTA_HOME="$HOME/.volta"
export PATH="$HOME/bin:$VOLTA_HOME/bin:$PATH"
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'

# source
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env" # rust
[ -f "$HOME/.config/git/git-prompt.sh" ] && . "$HOME/.config/git/git-prompt.sh"
[ -f "$HOME/.config/git/git-completion.bash" ] && . "$HOME/.config/git/git-completion.bash"
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env" # uv
[ -f "$HOME/.local/share/z/z.sh" ] && . "$HOME/.local/share/z/z.sh"
