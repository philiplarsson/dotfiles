#!/bin/bash

# J wrapper
# Requires autojump and fzf
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
        jumpDir="$(autojump --complete | sed 's/__[0-9]*__//' | fzf --height 40% --reverse --inline-info)"
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
