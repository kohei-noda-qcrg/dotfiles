#########################
# History
#########################
HISTCONTROL=ignoreboth # Ignore duplicated commands
HISTIGNORE='?:??:???:exit' # Ignore 1~3 character only commands and the exit command

#########################
# Color Settings
#########################

export LS_COLORS=$LS_COLORS:'di=0;36' # Change ls color to cyan


#########################
# Git settings
#########################
source "$HOME/.config/git/git-completion.bash" # bash/zsh completion support for core Git
source "$HOME/.config/git/git-prompt.sh" # Allows you to see repository status in your prompt
export GIT_PS1_SHOWDIRTYSTATE=1 # if you set GIT_PS1_SHOWDIRTYSTATE to a nonempty value, unstaged (*) and staged (+) changes will be shown next to the branch name.
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] ' # Change your PS1 to call __git_ps1 as command-substitution: Bash: PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '


#########################
# Aliases
#########################
alias alljob="bjobs -u all"
alias histalljobs="bjobs -u all -a"
alias bjobsworkdir="bjobs -l | awk '/Submitted/{printf \$10;getline;print \$1}' | sed 's/^<//' | sed 's/>.*//'"

#########################
# fzf
#########################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 80%'

#########################
# z
#########################
. ~/z/z.sh
