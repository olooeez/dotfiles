export PATH="$HOME/bin:/usr/local/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled
# zstyle ':omz:update' mode auto
# zstyle ':omz:update' mode reminder

zstyle ':omz:update' frequency 5

DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

# COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

export LANG=pt_BR.UTF-8

if [[ -n $SSH_CONNECTION ]]
then
	export EDITOR='vim'
else
	export EDITOR='mousepad'
fi

export ARCHFLAGS="-arch x86_64"

alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."

alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gp="git push"

alias la="ls -A"
alias ll="ls -lh"
alias lla="ls -lhA"

alias cl="clear"
alias rs="reset"
