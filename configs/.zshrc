autoload -U colors && colors

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# zsh prompt
PROMPT="%% "

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
alias ntmp="cd `mktemp -d`"
alias cd="z"
alias newtmux="tmux new-session -s "
alias less="less -R"
alias toke="xdg-open https://trello.com/b/3VG8VyWY/dont-forget"

# functions
hostname() {
    cat /etc/hostname
}

# env variables
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9e8c6e"

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/home/rmq/git/lua-language-server/3rd/luamake/luamake
[ -f "/home/rmq/.ghcup/env" ] && source "/home/rmq/.ghcup/env"

eval "$(zoxide init zsh)"

# The following lines were added by compinstall
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/rmq/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
