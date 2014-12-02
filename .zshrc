# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbynew"
set -o ignoreeof

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# set term to xterm unless in tmux
set -g xterm-keys on
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

#FUCK UPDATES
DISABLE_AUTO_UPDATE="true"

#Case complete
CASE_SENSITIVE="true"

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups:ignorespace

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gitfast vi-mode)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh_aliases

#Get rid of autocorrect bullshit
unsetopt correct_all

#Tmux window naming not reset
DISABLE_AUTO_TITLE=true

#Remove old Right prompts (insert, etc)
setopt transientrprompt

#emacs
bindkey -e
#Vi Mode Keybindings
#bindkey -v
#bindkey -M vicmd '^r' history-incremental-search-backward
#bindkey -M viins '^r' history-incremental-search-backward
#bindkey -M viins '^ ' vi-cmd-mode
#bindkey -M vicmd 't' history-search-backward
#bindkey -M vicmd '_' beginning-of-line
#bindkey -M vicmd 's' forward-char
#bindkey -M vicmd 't' up-line-or-history
#bindkey -M vicmd 'n' down-line-or-history
#bindkey '^W' backward-kill-word

export EDITOR='vi'


#Path Variable
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/home/rtroxler/bin

