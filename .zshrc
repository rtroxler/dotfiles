# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerline"
xrdb -merge ~/.Xresources
source ~/.powerline_prompt.sh
set -o ignoreeof

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# set term to xterm unless in tmux
set -g xterm-keys on
# export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color-bce

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
#bindkey -M viins '^r' history-incremental-search-backward
bindkey '^[' vi-cmd-mode
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M vicmd 'k' history-search-backward
bindkey -M vicmd '0' beginning-of-line
bindkey -M vicmd 'l' forward-char
bindkey -M vicmd 'k' up-line-or-history
bindkey -M vicmd 'j' down-line-or-history
#bindkey '^W' backward-kill-word
export KEYTIMEOUT=1

export EDITOR='vi'

function _backward_kill_default_word() {
  WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' zle backward-kill-word
}
zle -N backward-kill-default-word _backward_kill_default_word
bindkey '\e=' backward-kill-default-word   # = is next to backspace

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[red]%} [% %{$fg_bold[white]%} NORMAL %{$fg_bold[red]%}]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}

#Path Variable
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/home/rtroxler/bin

