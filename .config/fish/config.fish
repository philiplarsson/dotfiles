set -g -x PATH /usr/local/bin $PATH

# Add 256 color to tmux when using gnome-terminal
# export TERM="xterm-256color"
export TERM="screen-256color"
# export TERM=xterm-256color

# make Vim the default editor
set --export EDITOR "vim -f"

set PATH ~/Applications $PATH
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
