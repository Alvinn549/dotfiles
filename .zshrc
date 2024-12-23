if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)

source $ZSH/oh-my-zsh.sh

alias reload='source ~/.zshrc'
alias ls='ls --color=auto'
alias cat='batcat'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
