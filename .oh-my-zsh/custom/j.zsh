#!/bin/bash

# J wrapper
# Requires autojump, ag and fzf
# use with j <ENTER> for fzf list, or use j as usual.

j() {
    if [[ ${1} == -* ]] && [[ ${1} != "--" ]]
    then
      autojump ${@}
      return
    fi

    if [[ "$#" -ne 0 ]]; then
        jumpDir="$(autojump $@)"
    else
        jumpDir="$(autojump -s | ag -o '(?<=\d\.\d:\s).*' | sort -r | fzf --height 40% --reverse --inline-info --preview 'ls -A {}')"
    fi

    if [ -t 1 ]
    then
        echo -e "\\033[31m${jumpDir}\\033[0m"
    else
        echo -e "${jumpDir}"
    fi
    cd "${jumpDir}"

    return
}
