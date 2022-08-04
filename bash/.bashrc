#!/usr/bin/env bash
shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# Terminal colors
color_prompt=1

case "$TERM" in
	xterm-color) color_prompt=0 ;;
esac

if tput setaf 1 &> /dev/null; then
	bold=$(tput bold);
	reset=$(tput sgr0);
	blue=$(tput setaf 4);
	green=$(tput setaf 2);
	red=$(tput setaf 1);
	white=$(tput setaf 7);
	yellow=$(tput setaf 3);
else
	bold='';
	reset="\e[0m";
	blue="\e[4m";
	green="\e[2m";
	red="\e[1m";
	white="\e[7m";
	yellow="\e[3m";
fi

# Set my custom color prompt
if [ "$color_prompt" ]
then
	PS1="\[${bold}\][\[${red}\]\u\[${reset}\]\[${bold}${white}\]@\[${reset}\]\[${bold}${blue}\]\h \[${green}\]\W\[${reset}\]\[${bold}\]]\n\\[${yellow}\]\$ \[${reset}\]"
else
	PS1="[\u@\h \W]\n\\$ \[$(tput sgr0)\]"
fi

export PS1

# Use bash completions
if [ -f /etc/profile.d/bash_completion.sh ] && ! shopt -oq posix
then
	source /etc/profile.d/bash_completion.sh
fi

if [ -d /usr/local/share/bash_completion.d/ ] && ! shopt -oq posix
then
	source /usr/local/share/bash_completion.d/*
fi

if [ -d /etc/bash_completion.d/ ] && ! shopt -oq posix
then
	source /etc/bash_completion.d/*
fi

# XDG support
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

# Golang stuff
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Definition of some useful aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias bat='batcat --theme "ansi-dark"'
alias todo='todo.sh'
