#!/bin/bash

# Entry for login shells

# Load .bashrc, which loads: ~/.{aliases,functions,path,dockerfunc,kubefunc,exports,additions}
if [[ -r "${HOME}/.bashrc" ]]
then
    source "${HOME}/.bashrc"
fi