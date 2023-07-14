#!/bin/bash
# ~/.bashrc

#default PS1 prompt
#PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\$\[\e[;76m\] '

# PS1 prompt with git branch 
#PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\[\033[91m\]$(parse_git_branch) \[\e[0;34m\]\$\[\e[;76m\] '

# PS1 promit with git branch and k8s cluster
PS1='\[\e[0;76m\][\u@\[\e[0;34m\]\h \W]\[\033[91m\]$(parse_git_branch)$(k8s) \[\e[0;34m\]\$\[\e[;76m\] '

# source run commands files
for file in ~/.{aliases,functions,path,dockerfunc,exports,additions}
do
    if [[ -r "$file" ]] && [[ -f "$file" ]]
    then 
        source "$file"
    fi
done

# enable forward i-search in history
stty -ixon

# autocorrect typos in path names when using 'cd'
shopt -s cdspell
