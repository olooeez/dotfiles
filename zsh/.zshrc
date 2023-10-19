export PATH="$HOME/bin:/usr/local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export LANG="pt_BR.UTF-8"
export ARCHFLAGS="-arch x86_64"
export PATH="$HOME/go/bin:$PATH"
export WALLPAPER_PATH="$HOME/Imagens/Wallpapers"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

ZSH_THEME="half-life"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

alias gc="git commit --verbose --message"
alias gcm="git checkout $(git_main_branch)"
alias gcb="git checkout -b"
alias gm="git merge"
alias ga="git add"
alias gp="git push"

alias ls="ls --color=never -p"
alias la="ls -A"

alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
