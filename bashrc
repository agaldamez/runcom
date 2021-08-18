# ~/.bashrc file

# source dockerfunc for docker run commands 
if [[ -f ~/.dockerfunc ]]
then
   source ~/.dockerfunc
fi

# git branch bashrc
parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# PS1 prompt with git branch 
PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\[\033[91m\]$(parse_git_branch) \[\e[0;34m\]\$\[\e[;76m\] '

#default PS1 prompt
#PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\$\[\e[;76m\] '

# set default text editor
export EDITOR=vim
export VISUAL=vim

# bash history
export HISTSIZE=100000
export HISTCONTROL=ignoredups
export HISTFILESIZE=100000
export HISTTIMEFORMAT="%F %T "

# enable forward i-search in history
stty -ixon

# autocorrect typos in path names when using 'cd'
shopt -s cdspell 

# reload bashrc
alias vb='vim ~/.bashrc'
alias sb='. ~/.bashrc'

alias ll='ls -l'
alias lls='ls -la'
alias t='tmux'
alias c='clear'
alias e='exit'
alias st='storm'
alias h='history'
alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'
alias mkdir='mkdir -v'
alias chmod='chmod -v'
alias chgrp='chgrp -v'
alias chown='chown -v'
alias diff='colordiff'
alias ls="ls --color=always"
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"

# run virsh commands without sudo 
alias virsh="virsh --connect qemu:///system"

# docker shortcuts
alias dkrm='docker rm $(docker ps -qa)'
alias dkrmi='docker rmi $(docker images -q)'
alias dkvrm='docker volume rm $(docker volume ls -q)'
alias start-docker="sudo systemctl start docker"

# Search top 10 tags for a Docker image
dockertags() {
   curl -s "https://registry.hub.docker.com/v2/repositories/library/$1/tags/"|jq '."results"[]["name"]'
}

# vhosts
alias hosts='sudo vim /etc/hosts'

# cd to frequently used directories:
alias dl="cd ~/Downloads"
alias cdsh="cd ~/Documents/Programming/bash/"
alias cdpl="cd ~/Documents/Programming/perl/"
alias cdpy="cd ~/Documents/Programming/python/"

# directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# dynmaic port forwarding (SOCKS proxy)
alias ssh-tunnel='ssh -D 8080 -f -q -N $USER@$TUNNEL'
# reverse ssh tunnel
alias rssh-tunnel='ssh -R $SOURCE:SRC:DESTINATION:DST -N -f $USER@SOURCE'

# bcrc 
export BC_ENV_ARGS=$HOME/.bcrc

# ssh-agent
start_ssh_agent() {
    if [ -z "$SSH_AUTH_SOCK" ] 
    then
        eval $(ssh-agent -s)
        ssh-add id_rsa
    fi

    ssh-add -l | grep -i rsa > /dev/null
    if [ $? -ne 0 ] 
    then
        echo "ssh-key not in keyring"
        ssh-add
    fi
}
start_ssh_agent 

# gpg-agent for ssh
#start_gpg-agent() {
#    if [ -z "$SSH_AUTH_SOCK" ]
#    then
#       GPG_TTY=$(tty)
#       export GPG_TTY
#       export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#       eval $(gpg-agent --daemon)
#    fi
#}
#start_gpg-agent

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
