autoload -U colors && colors

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

autoload -Uz compinit
compinit
_comp_options+=(globdots)

prompt_end="%#"

function clock {
    echo "%{$fg[blue]%}[%{$fg[blue]%} %{$fg[cyan]%}%T %{$fg[blue]%}]%{$reset_color%}"
}
function path {
    echo "%{$fg[blue]%}%~%{$reset_color%}"
}
function user_hostname {
    echo "%{$fg[blue]%}[ %{$fg[cyan]%}%n@%m %{$fg[blue]%}]%{$reset_color%}"
}

PS1="%B$(user_hostname)%b %B$(clock)%b %B$(path)%b $(echo $prompt_end) "

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^A" beginning-of-line
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^K" kill-line

# aliases
alias ls="ls -lh --color"
alias grep="grep --color"

alias gst="git status"
alias gnc="git commit -m "
alias gall="git add ."

# functions
function je {
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
function j {
    if [ -z $1 ]; then
        echo "usage: j <alias>" > /dev/stderr
        return 1
    fi

    cd `jmp $1`
}

export EDITOR="nvim"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
