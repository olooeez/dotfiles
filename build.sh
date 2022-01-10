#!/usr/bin/env bash

# Colors
declare -gr BOLD="\033[1m"
declare -gr GREEN="\033[32m"
declare -gr YELLOW="\033[33m"
declare -gr RESET="\033[0m"

# Global variables
declare -gr USER_HOME=$(eval "echo ~$SUDO_USER")
declare -gr USER_NAME=$SUDO_USER

# Install papirus-icon-theme
function _papirus_icon_theme {
	if [ -d /usr/share/icons/Papirus ]
	then
		echo -e "${YELLOW}-papirus-icon-theme already installed${RESET}"
	else
		eval 'wget -qO- https://git.io/papirus-icon-theme-install | sh > /dev/null'
		echo -e "${YELLOW}-papirus-icon-theme installed${RESET}"
	fi
}

# Install some packages on debian
function _debian_packages {
	local packages_install=(
		build-essential
		golang
		pass
		git
		openjdk-17-jdk
		vim
		gpg
		cmake
		openssh-client
	)

	for i in "${packages_install[@]}"
	do
		eval "apt-get install $i -y > /dev/null"
		echo -e "${YELLOW}-${i} installed${RESET}"
	done
}

# Install all my dotfiles
function _dotfiles {
	local dotfiles_bash='.bashrc'
	local dotfiles_git='.config/git/config'
	local dotfiles_vim='.vimrc'

	eval "cp ${dotfiles_bash} ${USER_HOME}"
	echo -e "${YELLOW}-installed the ${dotfiles_bash} config${RESET}"
	eval "chown ${USER_NAME}:${USER_NAME} ${USER_HOME}/${dotfiles_bash}"

	eval "mkdir -p ${USER_HOME}/.config/git && cp ${dotfiles_git} ${USER_HOME}/.config/git"
	echo -e "${YELLOW}-installed the ${dotfiles_git} config${RESET}"
	eval "chown ${USER_NAME}:${USER_NAME} ${USER_HOME}/${dotfiles_git}"

	eval "cp ${dotfiles_vim} ${USER_HOME}"
	echo -e "${YELLOW}-installed the ${dotfiles_vim} config${RESET}"
	eval "chown ${USER_NAME}:${USER_NAME} ${USER_HOME}/${dotfiles_git}"
}

# Is root?
if [ "$EUID" -ne 0 ]
then
	echo "You need to be root to run this script"
	exit 1
fi

# Main
echo -e "${GREEN}Installing some packages${RESET}"
_debian_packages
echo -e "${GREEN}Installing papirus-icon-theme${RESET}"
_papirus_icon_theme
echo -e "${GREEN}Installing dotfiles${RESET}"
_dotfiles
