# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTSIZE=1000
HISTFILESIZE=2000

# directory colors
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# env variables
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] $\[\033[00m\] '
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'

# source
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env" # rust
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env" # uv
[ -f "$HOME/.local/share/z/z.sh" ] && . "$HOME/.local/share/z/z.sh"
