autoload -U colors && colors
autoload -Uz compinit
compinit

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# zsh prompt
PROMPT="%{$fg[blue]%}%~%{$reset_color%} > "

bindkey "^[[1;5C" forward-word 
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-char
bindkey "^J" forward-char 
bindkey "^A" beginning-of-line
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^O" accept-line

export NVM_DIR="$HOME/.nvm"
source ~/.zsh_aliases
source ~/.zsh_env
source ~/.zsh_functions

# plugins

# nvm
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zsh-autosuggestions
alias luamake=$HOME/git/lua-language-server/3rd/luamake/luamake
[ -f "/home/rmq/.ghcup/env" ] && source "/home/rmq/.ghcup/env"

eval "$(zoxide init zsh)"

# The following lines were added by compinstall
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename "$HOME/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh plugins
if [ "$(uname)" = "Darwin" ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    if command -v ngrok &>/dev/null; then
        eval "$(ngrok completion)"
    fi
else
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Startup
echo "It's $(date +%H:%M) \033[31m♥\033[0m"
