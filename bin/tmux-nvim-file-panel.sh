#!/usr/bin/bash

# first parameter: the orientation to split
# second paramenter: path to looking for files

if [[ $# -ne 2 ]]; then
    exit 0
fi

file=$(find $2 -mindepth 1 -not -path "*.git*" -type f | fzf --tmux 95% --preview="bat {} --color=always --style=full")

if [[ -z $file ]]; then
    exit 0
fi

case "$1" in
    -v) tmux splitw -v "nvim $file";;
    -h) tmux splitw -h "nvim $file";;
    *) exit 1;;
esac

