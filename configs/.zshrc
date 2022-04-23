autoload -U colors && colors

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

autoload -Uz compinit
compinit
_comp_options+=(globdots)

# zsh prompt
PROMPT="%B%{$fg[green]%}%1~%{$reset_color%} %# %b"

# bindkeys
## ctrl+right arrow to move cursor forward one word
## ctrl+left arrow to move cursor one word backward
## ctrl+a to line start
## ctrl+e to line end
## ctrl+k to delete all charecters from right of the cursor
## ctrl+o to act as "enter" (e.g. accept current line) 

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
alias lock="i3lock -i ~/.wallpapers/leaves-hard.jpg -n"
alias newtmux="tmux new-session -s "

# functions
findpkg() {
    ddgr --np "\!apkg $1"
}

# env variables
export EDITOR="nvim"
export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"

# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/home/rmq/git/lua-language-server/3rd/luamake/luamake
[ -f "/home/rmq/.ghcup/env" ] && source "/home/rmq/.ghcup/env"
