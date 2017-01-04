# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple-trox"
set -o ignoreeof

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# set term to xterm unless in tmux
#set -g xterm-keys on
# export TERM=xterm-256color
#[ -n "$TMUX" ] && export TERM=screen-256color-bce
#export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

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
plugins=(git gitfast vi-mode zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source $HOME/.zsh_aliases

#Get rid of autocorrect bullshit
unsetopt correct_all

#Tmux window naming not reset
DISABLE_AUTO_TITLE=true


#emacs
#bindkey -e
# VIM
bindkey -v
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^e' end-of-line
bindkey -M viins '^a' beginning-of-line
export EDITOR='nvim'
export KEYTIMEOUT=1

# need to upgrade zsh for these V
# #text objects for vi mode
#autoload -U select-bracketed select-quoted
#zle -N select-bracketed
#zle -N select-quoted
  #for km in viopp visual; do
  #bindkey -M $km -- '-' vi-up-line-or-history
  #for c in {a,i}"${(s..):-\'\"\`\|,./:;-=+@}"; do
    #bindkey -M $km $c select-quoted
  #done
  #for c in {a,i}${(s..):-'()[]{}<>bB'}; do
    #bindkey -M $km $c select-bracketed
  #done
#done

#function _backward_kill_default_word() {
  #WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' zle backward-kill-word
#}
#zle -N backward-kill-default-word _backward_kill_default_word
#bindkey '\e=' backward-kill-default-word   # = is next to backspace

#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[red]%} [% %{$fg_bold[black]%} NORMAL %{$fg_bold[red]%}]% %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    #zle reset-prompt
#}

## Set current BASE16 color (pretty colors)
##  source $HOME/.zsh-current-color

##Path Variable
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/bin:$HOME/.rbenv/bin:$HOME/.cargo/bin:/usr/local/lib/apache-maven-3.3.9/bin:$PATH

eval "$(rbenv init -)"

export MYVIMRC="~/.config/nvim/init.vim"
export NVM_DIR="/Users/ryantroxler/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

##[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ulimit -n 2560
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=1'

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# For Elixir/Erlang
. $HOME/.asdf/asdf.sh
#export JAVA_HOME=`/usr/libexec/java_home`
