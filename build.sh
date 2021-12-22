#!/usr/bin/env bash

# Global variables
declare -gr CATEGORY_SPACES="  "

# Function to install atom and some plugins
function _atom {
	local atom_latest="https://api.github.com/repos/atom/atom/releases/latest"
	local atom_download

	if which atom > /dev/null
	then
		echo "${CATEGORY_SPACES}-atom installed"
		return 0
	fi

	echo "${CATEGORY_SPACES}-Getting the latest atom release"
	atom_download=$(curl -s ${atom_latest} | jq -r ".assets[].browser_download_url" | grep ".deb")

	echo "${CATEGORY_SPACES}-Downloading atom"
	eval "wget -qq -O atom.deb $atom_download"

	echo "${CATEGORY_SPACES}-Installing atom"
	eval "dpkg -i atom.deb && apt install -f"

	echo "${CATEGORY_SPACES}-atom installed"

	echo "${CATEGORY_SPACES}-Installing atom plugins"

	local atom_plugins=(
		dracula-syntax
		file-icons
		minimap
		platformio-ide
	)

	for i in "${atom_plugins[@]}"
	do
		eval "apm install $i > /dev/null"
		echo "${CATEGORY_SPACES}-$i installed"
	done
}

# Function to install papirus-icon-theme
function _papirus_icon_theme {
	if [ -d "/usr/share/icons/Papirus" ]
	then
		echo "${CATEGORY_SPACES}-papirus-icon-theme installed"
		return 0
	fi

	echo "${CATEGORY_SPACES}-Adding the papirus repository"
	eval "add-apt-repository ppa:papirus/papirus > /dev/null"

	echo "${CATEGORY_SPACES}-Updating the repositorys"
	eval "apt-get update > /dev/null"

	echo "${CATEGORY_SPACES}-Installing papirus icon theme"
	eval "apt-get install papirus-icon-theme"

	echo "${CATEGORY_SPACES}-papirus-icon-theme installed"
}

# Function to install some accessible packages in ubuntu mate
function _ubuntu_packages {
	local packages_install=(
		build-essential
		ssh
		golang
		python3-pip
		pass
		git
		gpg
		openssh-client
		htop
	)

	for i in "${packages_install[@]}"
	do
		eval "apt-get install $i -y > /dev/null"
		echo "${CATEGORY_SPACES}-${i} installed"
	done
}

# Function to install all my dotfiles
function _dotfiles {
	local dotfiles_atom='.atom'
	local dotfiles_bash='.bashrc'
	local dotfiles_git='.config/git/config'

	eval "mkdir -p ${HOME}/${dotfiles_atom} && cp .atom/* ${HOME}/${dotfiles_atom}"
	echo "${CATEGORY_SPACES}-installed the ${dotfiles_atom} config"

	eval "cp ${dotfiles_bash} ${HOME}"
	echo "${CATEGORY_SPACES}-installed the ${dotfiles_bash} config"

	eval "mkdir -p ${HOME}/.config/git && cp ${dotfiles_git} ${HOME}/.config/git"
	echo "${CATEGORY_SPACES}-installed the ${dotfiles_git} config"
}

# Is root?
if [ "$EUID" -ne 0 ]
then
	echo "You need to be root to run this script"
	exit 1
fi

# Main
echo "Installing ubuntu packages"
_ubuntu_packages
echo "Installing papirus-icon-theme"
_papirus_icon_theme
echo "Installing atom"
_atom
echo "Installing dotfiles"
_dotfiles
