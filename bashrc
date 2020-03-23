# ~/.bashrc file

# git branch bashrc
#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

# PS1 prompt with git branch 
#PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\[\033[0;33m\]$(parse_git_branch)\e[0;34m\]\$\[\e[;76m\] '

#default PS1 prompt
PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\$\[\e[;76m\] '

# bash history
export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000

# enable forward i-search in history
stty -ixon

# reload bashrc
alias vb='vim ~/.bashrc'
alias sb='. ~/.bashrc'

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
#alias diff='colordiff'
alias ls="ls --color=always"

# docker shortcuts
alias dkrm='docker rm $(docker ps -qa)'

# cd to frequently used directories:
alias cdsh="cd ~/Documents/Programming/bash/"
alias cdpl="cd ~/Documents/Programming/perl/"
alias cdpy="cd ~/Documents/Programming/python/"

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

# ssh-agent
start_ssh_agent() {
    if [ -z "$SSH_AUTH_SOCK" ] 
    then
        eval $(ssh-agent -s)
        ssh-add
    fi

    ssh-add -l | grep -i rsa > /dev/null
    RESULT=$?
    if [ $RESULT -ne 0 ] 
    then
        echo "ssh-key not in keyring"
        ssh-add
    fi
}
start_ssh_agent 

# colorized man pages
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

# print 256-colour
colour() { 
    for i in {0..255}
    do 
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done
}
