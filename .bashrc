test -s ~/.alias && . ~/.alias || true
#set -o vi
#export PATH=/sbin:/usr/sbin:/usr/local/sbin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:/home/ekendahl/scripts
export EDITOR=vi


# DEALING WITH NX LIBRARY ISSUE
unset LD_PRELOAD

#exporting 256 colors while testing iPAD access
#export TERM=xterm-256color

#PROMPT
export PS1="\u@\h:\W> "

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/$USER/bin

if [ -f "$HOME/.alias" ]; then
   source "$HOME/.alias"
fi

if [ -f "$HOME/.local_setup" ]; then
   source "$HOME/.local_setup"
fi
