bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char

# Search through history for previous commands matching everything up to current cursor position.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

