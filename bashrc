# ~/.bashrc file

# git branch bashrc
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# default PS1 prompt
#PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\$\[\e[;76m\] '

# PS1 prompt with git branch 
PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\[\033[0;33m\]$(parse_git_branch)\e[0;34m\]\$\[\e[;76m\] '

# bash history
export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000

# enable forward i-search in history
stty -ixon

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

# start service shortcuts
alias start_ovs="sudo systemctl start ovs-vswitchd"
alias start_docker="sudo systemctl start docker"
alias start_libvirt="sudo systemctl start libvirtd"

# directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# bcrc 
export BC_ENV_ARGS=$HOME/.bcrc

# colorized man
export GROFF_NO_SGR=yes
man() {
   env \
       LESS_TERMCAP_mb=$(printf "\e[35m") \
       LESS_TERMCAP_md=$(printf "\e[34m") \
       LESS_TERMCAP_me=$(printf "\e[0m") \
       LESS_TERMCAP_se=$(printf "\e[0m") \
       LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
       LESS_TERMCAP_ue=$(printf "\e[0m") \
       LESS_TERMCAP_us=$(printf "\e[34m") \
           man "$@"
}

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
