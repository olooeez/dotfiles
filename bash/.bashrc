#!/usr/bin/env bash

shopt -s histappend
shopt -s checkwinsize

color_prompt=1

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
	xterm-color) color_prompt=0 ;;
esac

if tput setaf 1 &> /dev/null; then
	bold=$(tput bold);
	reset=$(tput sgr0);
	blue=$(tput setaf 153);
	green=$(tput setaf 71);
	red=$(tput setaf 167);
	white=$(tput setaf 15);
	yellow=$(tput setaf 228);
else
	bold='';
	reset="\e[0m";
	blue="\e[1;34m";
	green="\e[1;32m";
	red="\e[1;31m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi

export PS1

if [ "$color_prompt" ]
then
	PS1="\[${bold}\][\[${red}\]\u\[${reset}\]\[${bold}${white}\]@\[${reset}\]\[${bold}${blue}\]\h \[${green}\]\W\[${reset}\]\[${bold}\]]\n\\[${yellow}\]\$ \[${reset}\]"
else
	PS1="[\u@\h \W]\n\\$ \[$(tput sgr0)\]"
fi

export PS1

if [ -f /etc/bash_completion ] && ! shopt -oq posix
then
	# shellcheck source=/dev/null
	source /etc/bash_completion
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
