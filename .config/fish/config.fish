set -g -x PATH /usr/local/bin $PATH

# Add 256 color to tmux when using gnome-terminal
export TERM="xterm-256color"

# make Vim the default editor
set --export EDITOR "vim -f"

