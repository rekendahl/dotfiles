#!/bin/bash -ex
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#

export EDITOR="vim"
bindkey -v 

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward  

setopt AUTO_CD

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT=' %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) $(virtualenv_info)%(?,,%{${fg_bold[blue]}%}[%?]%{$reset_color%} )$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%{$fg[red]%}%(?..⤬)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'


# FIXME$: Perhaps no the most robust check but I need to separate between Linux at work and Macs. 

if [ "$OSTYPE" = "linux-gnu" ]; then
   PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/ekendahl/scripts:/usr/eda/synopsys/vcs/latest/bin:/usr/eda/synopsys/synplify/latest/bin:/usr/eda/synopsys/arc/ARChitect/4.19.4/bin/linux:/usr/eda/synopsys/arc/latest/MetaWare/ide/:/usr/eda/synopsys/arc/latest/MetaWare/arc/bin:/usr/eda/synopsys/coretools/latest//bin:/usr/eda/xilinx/latest/ISE_DS/common/bin/lin64:/usr/eda/xilinx/latest/ISE_DS/ISE/sysgen/bin:/usr/eda/xilinx/latest/ISE_DS/PlanAhead/bin:/usr/eda/xilinx/latest/ISE_DS/ISE/bin/lin64:/usr/eda/xilinx/latest/ISE_DS/ISE/sysgen/util:/usr/eda/xilinx/latest/ISE_DS/EDK/bin/lin64:/usr/eda/xilinx/latest/ISE_DS/EDK/gnu/microblaze/lin64/bin:/usr/eda/xilinx/latest/ISE_DS/EDK/gnu/powerpc-eabi/lin64/bin:/usr/home/ekendahl/Projects/haps/hapsmap/lin:/usr/eda/synopsys/vera/latest/vera_vD-2009.12-15_linux/bin:/home/bcharette/plx_tech/PEX_SIM_MODELS:/home/bcharette/plx_tech/PEX_SIM_MODELS/lib/linux.lib:/usr/eda/synopsys/arc/ARChitect/2.19.4/lib/linux:/usr/eda/synopsys/vera/latest/vera_vD-2009.12-15_linux/lib:/usr/eda/synopsys/vera/latest/vera_vD-2009.12-15_linux/lib/mti:/usr/eda/synopsys/vera/latest/vera_vD-2009.12-15_linux/lib/nc_vhdl:/usr/eda/synopsys/vera/latest/vera_vD-2009.12-15_linux/lib/sro:/usr/eda/synopsys/vera/latest/vera_vD-2009.12-15_linux/lib/vlog:/home/ekendahl/Projects/legacy/hsd/verification/scripts
else
   PATH=/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/ekendahl/bin
fi

export PATH
