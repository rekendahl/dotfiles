# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git cp mosh vi-mode)

source $ZSH/oh-my-zsh.sh

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# User configuration
export DEFAULT_USER=ekendahl
export GRADLE_HOME="$HOME/Projects/gradle-2.14"

export PATH="$PATH:$HOME/bin:$GRADLE_HOME/bin"
if [ "$OSTYPE" = "darwin13.0" ]; then
    export PATH="/usr/local/bin:$PATH:$HOME/anaconda/bin"
fi
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Note! On mac /usr/local/bin/vim is symbolic link to mvim
# when launched as vim it automatically starts in terminal mode
export EDITOR='vim'
bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
if [ -f "$HOME/.alias" ]; then
   source "$HOME/.alias"
fi
if [ -f "$HOME/.local_setup.sh" ]; then
   source "$HOME/.local_setup.sh"
fi

# EDAPHIC
export JAVA_HOME=/Library/Java/Home
export PATH=$PATH:$JAVA_HOME/bin

# PSVM Stuff:
export TIP_SW=$HOME/local/TIP_SW
export PSVMPATH=$HOME/local/psvm/
export PYTHONPATH=$PSVMPATH:$TIP_SW/Source/PyTipTypes

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
