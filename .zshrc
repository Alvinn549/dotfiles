# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$(whoami).zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$(whoami).zsh"
fi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git aliases zsh-autosuggestions zsh-syntax-highlighting fzf laravel)

source $ZSH/oh-my-zsh.sh

alias reload='source ~/.zshrc'

alias c='clear'

if command -v eza >/dev/null 2>&1; then
    alias ls='eza -ag --icons=always'
    alias ll='eza -agl --icons=always'
    alias lh='eza -aglh --icons=always'
    alias lt='eza -a --tree --level=1 --icons=always'
else
    alias ls='ls --color=auto'
    alias ll='ls -la'
    alias lh='ls -lah'
    alias lt='tree -L 1'
fi

alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'

alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias uplist='apt list --upgradable'
alias autoremove='sudo apt autoremove'
alias autoclean='sudo apt autoclean'
alias aptsearch='sudo apt search'

php_switcher_path="$HOME/Projects/php-switcher"

if [[ -f $php_switcher_path/php-switcher.sh ]]; then
    alias php-switcher="sudo $php_switcher_path/php-switcher.sh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
