############################################################
# Bash Settings
# Maintainer
#  Peng Cheng
# Version:
#  0.1 - 27/09/2017
############################################################

# User Info

export USERNAME="Peng Cheng"
export NICKNAME="awwwesssooooome"

# Distribute bashrc into smaller, more specific files

#source .shells/defaults
#source .shells/functions
#source .shells/exports
#source .shells/alias
#source .shells/prompt   # Fancy prompt with time and current working dir
#source .shells/git      # Conveniences - Display current branch etc

# Welcome message
#echo -ne "Good Morning, $NICKNAME! It's "; date '+%A, %B %-d %Y'

#export PS1="\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h\[$(tput setaf 5)\]$(tput setaf 1)\w\[$(tput bold)\]\[$(tput setaf 1)\]]\[$(tput setaf 1)\]\\$\[$(tput sgr0)\] "

#$(tput setaf 1)\w\n\[$(tput bold)\]
#$(tput setaf 1)\w\[$(tput bold)\]

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

HISTSIZE=35
HISTFILESIZE=35
