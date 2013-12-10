# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbynew"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

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

#Get rid of autocorrect bullshit
unsetopt correct_all

#Tmux window naming not reset
DISABLE_AUTO_TITLE=true

#Remove old Right prompts (insert, etc)
setopt transientrprompt

#Vi Mode Keybindings
bindkey -v
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M viins 'ii' vi-cmd-mode
bindkey -M vicmd 't' history-search-backward
bindkey -M vicmd '_' beginning-of-line
bindkey -M vicmd 's' forward-char
bindkey -M vicmd 't' up-line-or-history
bindkey -M vicmd 'n' down-line-or-history
bindkey '^W' backward-kill-word


#Aliases
alias vbox='vboxheadless -s devvm1.3'
alias clock='tty-clock -bcst -C 6'
alias fuckcaps='xmodmap -e "clear Lock"; setxkbmap -option caps:backspace'
alias vh='vi ~/.config/herbstluftwm/autostart'
alias hc='herbstclient '
alias e='emacs -nw'
alias ez='e ~/.zshrc'
alias vz='vi ~/.zshrc'
alias sz='source ~/.zshrc'
alias ...='../..'
alias ....='../../..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias workaround='sshfs -o nonempty -o workaround=rename rtroxler@veld.ome.ksu.edu:/as/data/app/axio /as/data/app/axio'
alias tree='tree --charset iso-8859'
alias shit='cd /as/data/jboss/ome/work/jboss.web/localhost/' 
alias server='jboss.pl -i ome -a clean; jboss.pl -i ome -a debug'
alias mountnfs='sudo mount -t nfs4 -o proto=tcp,port=2049 192.168.56.101:/ome/ /home/rtroxler/vm'
alias mountrepo='sudo mount -t nfs4 -o proto=tcp,port=2049 192.168.56.101:/ome/.m2/repository /home/rtroxler/.m2/repository'
alias shoop='ssh ome@localhost -p10022'
alias mvEar='mv ~/Dev/Axio-trunk/astra-App/target/*.ear ~/vm/'

#exported shit
export M2_HOME=/usr/share/maven
export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45
export JAVA_OPTS='-Xms512m -Xmx1024m -XX:MaxPermSize=1024m'
export MAVEN_OPTS='-Xms512m -Xmx1024m -XX:MaxPermSize=200m'
export REBEL_HOME='/home/ome/apps/jrebel'
export SVN_ROOT='svn+ssh://svn.ome.ksu.edu/as/data/svnroot/ome-appdev/'
export EDITOR='vi'


#Path Variable
export PATH=$PATH:/Users/rtroxler/.rvm/gems/ruby-2.0.0-p0/bin:/Users/rtroxler/.rvm/gems/ruby-2.0.0-p0@global/bin:/Users/rtroxler/.rvm/rubies/ruby-2.0.0-p0/bin:/Users/rtroxler/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$M2_HOME/:/home/rtroxler/bin


