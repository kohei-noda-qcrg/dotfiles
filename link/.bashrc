# If not running interactively, don't do anything
if [ "$SHLVL" -ge 1 ]; then
case $- in
    *i*) ;;
      *) return;;
esac
fi

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
alias vi='nvim'
alias vim='nvim'
alias fm='yazi' # file manager
alias ij='zellij'

# export
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] $\[\033[00m\] '

# source
[ -f "$HOME/.config/git/git-prompt.sh" ] && . "$HOME/.config/git/git-prompt.sh"
[ -f "$HOME/.config/git/git-completion.bash" ] && . "$HOME/.config/git/git-completion.bash"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash
[ -f "$HOME/.local/share/z/z.sh" ] && . "$HOME/.local/share/z/z.sh"
[ -f "/etc/modules/init/bash" ] && . "/etc/modules/init/bash"
[ -f "/usr/share/modules/init/bash" ] && . "/usr/share/modules/init/bash"

if type module &> /dev/null; then
   module use --append "$HOME/modulefiles"
fi

# functions
docker() {
    if [[ "$@" == "purge" ]]; then
        # Remove all stopped containers, unused networks, dangling images, build chaches, and volumes
        docker system prune -a --volumes
    else
        command docker "$@"
    fi
}
