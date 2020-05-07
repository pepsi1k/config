#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#case "$TERM" in 
#	'xterm') TERM=xterm-256-color;;
#esac


alias ls='ls --color=auto'
alias pacman='pacman --color=auto'
alias grep='grep --color=auto'
alias t='trans -b'
alias ts='trans -speak'
alias v='nvim'
alias diff='diff --color=auto'
alias r='ranger'
alias SS='sudo systemctl'
alias k='kubectl'
alias d-c='docker-compose'

case $1 in
	"root")
		PS1='[\[\033[1;38;5;255m\]\u\[\033[0m\]@\h \W]\[\033[1;38;5;198m\]\$\[\033[0m\] '
		;;
	*)
		PS1='[\[\033[1;38;5;255m\]\u\[\033[0m\]@\h \W]\[\033[1;38;5;106m\]\$\[\033[0m\] '
esac





export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
