autoload -U colors && colors

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=.zsh_history
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
    echo "%{$fg[blue]%}[ %{$fg[cyan]%}%n @ %m %{$fg[blue]%}]%{$reset_color%}"
}

PS1="$(user_hostname) $(path) $(clock) $(echo $prompt_end) "

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# aliases
alias ls="ls -l --color"
alias grep="grep --color"

alias gst="git status"
alias gnc="git commit -m "
alias gall="git add ."

# functions
function usejmp {
    $1 $(/usr/local/bin/jmp $2)
}
function jedit {
    /usr/bin/nvim $(/usr/local/bin/jmp $1)
}
function jto {
    /usr/bin/cd $(/usr/local/bin/jmp $1)
}
