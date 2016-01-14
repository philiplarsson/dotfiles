set -g -x PATH /usr/local/bin $PATH

# Add 256 color to tmux when using gnome-terminal
export TERM="xterm-256color"


    # Add this to your ~/.config/fish/config.fish
    # Syntax:
    # To just rerun your last command, simply type '!!'
    # This forked version supports "sudo !!" via two functions.
#function !!
#        eval $history[1] $argv
#end function

#function sudo
#    if test $argv
#        if test $argv = "!!"
#           eval /usr/bin/sudo $history[1]
#        else
#           eval /usr/bin/sudo $argv
#        end
#    end
#end

