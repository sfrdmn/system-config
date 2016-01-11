# Usage: Source this in your local .bashrc

alias vi="vim"
alias ls="ls -F"
alias lsa="ls -a"
alias lsl="ls -l"
alias git_dangling='git fsck --cache --unreachable $(git for-each-ref --format="%(objectname)"'
alias lns="ln -sf"
alias gs="git status"
alias gc="git commit"
alias gl="git log"
alias swift-repl="xcrun swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk"

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
  mv *.sed.tmp /tmp
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

function gitinit() {
  git init
  printf "# ✌\n" > README.md
  printf "*.swp\nnode_modules/\n.DS_Store\n" > .gitignore
  git add README.md .gitignore
  git commit -m "Initial commit."
}

# BASH prompt
export PS1='\[$(tput setaf 4)\][\[$(tput setaf 6)\]\w\[$(tput setaf 5)\]$(__git_ps1 "(%s)")\[$(tput setaf 4)\]]$ \[$(tput sgr0)\]'
export GIT_PS1_SHOWDIRTYSTATE=true
export REACT_EDITOR=vim
