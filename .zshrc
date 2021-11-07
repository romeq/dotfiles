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
