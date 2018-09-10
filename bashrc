# prompt shell
PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\$\[\e[;76m\] '

# no duplicate lines in the history
export HISTCONTROL=ignoredups
export HISTSIZE=10000

# reload bashrc
alias vb='vi ~/.bashrc'
alias vbd='. ~/.bashrc'

alias t='tmux'
alias c='clear'
alias e='exit'
alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'
alias mkdir='mkdir -v'
alias chmod='chmod -v'
alias chgrp='chgrp -v'
alias chown='chown -v'

# directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# bcrc 
export BC_ENV_ARGS=$HOME/.bcrc

# extract things        
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1        ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xvf $1        ;;
             *.tbz2)      tar xvjf $1      ;;
             *.tgz)       tar xvzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
