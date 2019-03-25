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
alias ls="ls --color=always"

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
    if [ -z "$SSH_AUTH_SOCK" ]; 
    then
        eval $(ssh-agent -s)
        ssh-add
    fi

    ssh-add -l | grep -i rsa
    RESULT=$?
    if [ $RESULT -eq 0 ]; 
    then
        echo "ssh-key already in keyring"
    else
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
