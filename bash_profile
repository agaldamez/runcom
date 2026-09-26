#!/bin/bash

# Entry for login shells

# Load .bashrc, which loads: ~/.{aliases,functions,path,dockerfilerc,exports}
if [[ -r "${HOME}/.bashrc" ]]
then
    source "${HOME}/.bashrc"
fi
