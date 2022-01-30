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
alias ddg="ddgr --np"
alias l="exa"
alias lh="exa -l"
alias ls="echo use 'l' or 'lh'"
alias grep="grep --color"
alias ntmp="cd `mktemp -d`"
alias lock="i3lock -i /etc/wallpapers/login.png -n"
# aliases for absolute paths. (needed for doas configuration to be safe)
alias pacman="/usr/bin/pacman"

# functions
je() {
    if [ -z $1 ]; then
        echo "usage: je <alias>" > /dev/stderr
        return 1
    fi
    if [ -n $EDITOR ]; then
        $EDITOR `jmp $1`
    else
        nano `jmp $1`
    fi
}

j() {
    if [ -z $1 ]; then
        echo "usage: j <alias>" > /dev/stderr
        return 1
    fi

    cd `jmp $1`
}

searchpkg() {
    ddgr --np "\!apkg $1"
}

export NVM_DIR="$HOME/.nvm"
load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# env variables
export EDITOR="nvim"
export PATH="$PATH:$HOME/.scripts"

# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/mauri/mauri

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
