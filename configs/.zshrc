autoload -U colors && colors

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

autoload -Uz compinit
compinit
_comp_options+=(globdots)

# zsh prompt
PROMPT="%B%{$fg[green]%}%1~%{$reset_color%} %# %b"

bindkey "^[[1;5C" forward-word 
bindkey "^[[1;5D" backward-word
bindkey "^A" beginning-of-line
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^O" accept-line

# aliases
alias gdb="gdb -q"
alias ddg="ddgr --np"
alias l="exa"
alias lf="exa -l"
alias grep="grep --color"
alias ntmp="cd `mktemp -d`"

alias newtmux="tmux new-session -s "
alias less="less -R"

# functions
findpkg() {
    ddgr --np "\!apkg $1"
}

# env variables
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/home/rmq/git/lua-language-server/3rd/luamake/luamake
[ -f "/home/rmq/.ghcup/env" ] && source "/home/rmq/.ghcup/env"
