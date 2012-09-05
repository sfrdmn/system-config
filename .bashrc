# Aliases
alias vi="vim"
alias lsa="ls -a"
alias lsl="ls -l"

function findgrep {
  find . -exec grep "$@" {} \; 2>/dev/null
}

# BASH prompt
export PS1='\[$(tput setaf 4)\][\[$(tput setaf 6)\]\w\[$(tput setaf 5)\]$(__git_ps1 "(%s)")\[$(tput setaf 4)\]]$ \[$(tput sgr0)\]'
export GIT_PS1_SHOWDIRTYSTATE=true
