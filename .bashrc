# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

ulimit -s unlimited

SCRIPTDIR=/home/.common

##################################
#
# for Compiler
#

COMPILER=INTEL19.0
#COMPILER=INTEL18.0
#COMPILER=INTEL17.0
#COMPILER=INTEL15.0
# COMPILER=PGI17
#COMPILER=PGI16
#COMPILER=PGI15

##################################
#
# for MPI
#

MPI=IntelMPI
#MPI=OpenMPI
#MPI=MPICH
#MPI=MPICH2

for script in $SCRIPTDIR/$COMPILER/*.sh $SCRIPTDIR/$COMPILER/$MPI/*.sh $SCRIPTDIR/*.sh; do
	if [ -r $script ]; then
		. $script
	fi
done

#########################
# OpenMP, MKL parallel
#########################
NUMTHREADS=1
export OMP_NUM_THREADS=$NUMTHREADS
export MKL_NUM_THREADS=$NUMTHREADS

#########################
# pyenv
#########################
#<< "#COMMENT"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export PATH=$HOME/.local/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
#COMMENT

#########################
# PETSC, Slepc
########################

export PETSC_ARCH=arch-linux-c-debug
export PETSC_DIR=$HOME/Software/petsc
export SLEPC_DIR=$HOME/Software/slepc/slepc-3.16.1

########################
# path
########################
#export PATH=$HOME/batch/analyze:$PATH

#########################
# History
#########################
HISTCONTROL=ignoreboth # Ignore duplicated commands
HISTIGNORE='exit'      # Ignore exit command

#########################
# Color Settings
#########################

export LS_COLORS=$LS_COLORS:'di=0;36' # Change ls color to cyan
#########################
# Module load
#########################
#module restore >/dev/null
#<<"#COMMENT"
module use --append "/opt/intel/oneapi/modulefiles-HPCS"
module use --append "$HOME/modulefiles" # Add my modules
module purge 		# deactivate all modules
# module load cmake 	# Load default cmake
module load inspector advisor
# module load git 	# Load git
#COMMENT
module use --append "/home/noda/toyprograms/modulefiles"

COMMON_MODULEDIR=/home/.common/modulefiles/etc
if [ -d $COMMON_MODULEDIR ]; then
	module use $COMMON_MODULEDIR
fi

module load lsf-ce10.1
module load 16c01

#########################
# Git settings
#########################
source "$HOME/.config/git/.git-completion.bash"                                                               # bash/zsh completion support for core Git
source "$HOME/.config/git/git-prompt.sh"                                                                      # Allows you to see repository status in your prompt
export GIT_PS1_SHOWDIRTYSTATE=1                                                                               # if you set GIT_PS1_SHOWDIRTYSTATE to a nonempty value, unstaged (*) and staged (+) changes will be shown next to the branch name.
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] ' # Change your PS1 to call __git_ps1 as command-substitution: Bash: PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#########################
# Aliases
#########################

# bjobs
alias alljob="bjobs -u all"
alias histalljobs="bjobs -u all -a"
alias bjobsworkdir="bjobs -l | awk '/Submitted/{printf \$10;getline;print \$1}' | sed 's/^<//' | sed 's/>.*//'"
alias alljobsworkdir="bjobs -u all -l | awk '/Submitted/{printf \$10;getline;print \$1}' | sed 's/^<//' | sed 's/>.*//'"
function checkjobs() {
	default_sec=10
	if [ -z $1 ]; then
		sec=$default_sec
	else
		case $1 in
		'' | *[!0-9]*)
			echo -e "** WARNING **\nThe variable you specified is not a natural number.\nUse the default setting...\n"
			sec=$default_sec
			;;
		*) sec=$1 ;;
		esac
	fi
	echo -e "Start checkjobs command.\nCheck jobs you submitted every $sec seconds."
	while true; do
		bjobs
		sleep $sec
	done
}

#########################
# fzf
#########################
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 80%'

#########################
# z
#########################
. ~/z/z.sh

#########################
# Debug options
#########################

# IDEBUG is debug options for Intel Fortran. GDEBUG is for GNU Fortran.
export IDEBUG="-check -traceback -debug extended -debug-parameters -warn"
export GDEBUG="-Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=all -fbacktrace"

#########################
# Nodenv
#########################

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"


export FI_PROVIDER=TCP # Setting for TCP
#export FI_PROVIDER=MLX  # Setting for infiniband

# intel-oneapi setvars
. /opt/intel/oneapi/setvars.sh intel64 --force >/dev/null
