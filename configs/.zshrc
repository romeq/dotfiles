autoload -U colors && colors
autoload -Uz compinit
compinit

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# zsh prompt
PS1="%% "

bindkey "^[[1;5C" forward-word 
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-char
bindkey "^J" forward-char 
bindkey "^A" beginning-of-line
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^O" accept-line

# aliases
alias gdb="gdb -q"
alias l="exa"
alias lf="exa -l"
alias grep="grep --color=always"
alias ntmp="cd $(mktemp -d)"
alias nvimtmp="nvim $(mktemp)"
alias cd="z"
alias newtmux="tmux new-session -s "
alias less="less -R"
alias toke="xdg-open https://trello.com/b/3VG8VyWY/dont-forget"

# functions
hostname() {
    cat /etc/hostname
}
_time_alias() {
    alias $1="time $1"
}
_time_sudo_alias() {
    alias $1="time sudo $1"
}
_time_sudo_alias "pacman" 
_time_alias "paru" 

# env variables
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9e8c6e"

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=$HOME/git/lua-language-server/3rd/luamake/luamake
[ -f "/home/rmq/.ghcup/env" ] && source "/home/rmq/.ghcup/env"

eval "$(zoxide init zsh)"

# The following lines were added by compinstall
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/rmq/.zshrc'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
