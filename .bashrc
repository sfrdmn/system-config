# Aliases
alias vi="vim"
alias ls="ls -F"
alias lsa="ls -a"
alias lsl="ls -l"
alias git_unreachable='git fsck --cache --unreachable $(git for-each-ref --format="%(objectname)"'

function findgrep {
  find . -exec grep "$@" {} \; 2>/dev/null
}

function sedall {
  sedcmd=$1
  shift
  for path in "$@"
  do
    sed -E -i ".sed.tmp" "$sedcmd" $path
  done
}

# cool B)
function spinner() {
  PROC=$1
  while [ -d /proc/$PROC ];do
    echo -n '/^H' ; sleep 0.05
    echo -n '-^H' ; sleep 0.05
    echo -n '\^H' ; sleep 0.05
    echo -n '|^H' ; sleep 0.05
  done
}

# BASH prompt
export PS1='\[$(tput setaf 4)\][\[$(tput setaf 6)\]\w\[$(tput setaf 5)\]$(__git_ps1 "(%s)")\[$(tput setaf 4)\]]$ \[$(tput sgr0)\]'
export GIT_PS1_SHOWDIRTYSTATE=true
