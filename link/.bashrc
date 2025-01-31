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

# source
[ -f "$HOME/.config/git/git-prompt.sh" ] && . "$HOME/.config/git/git-prompt.sh"
[ -f "$HOME/.config/git/git-completion.bash" ] && . "$HOME/.config/git/git-completion.bash"
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"
[ -f "$HOME/.local/share/z/z.sh" ] && . "$HOME/.local/share/z/z.sh"
