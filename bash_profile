#!/bin/bash

# Load .bashrc, which loads: ~/.{aliases,functions,path,dockerfunc,exports}
if [[ -r "${HOME}/.bashrc" ]]
then
    source "${HOME}/.bashrc"
fi
