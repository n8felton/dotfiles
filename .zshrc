
if [[ -d "${ZDOTDIR:-$HOME}"/.zsh.d ]]; then
    for ZSH_FILE in $(ls -A "${ZDOTDIR:-$HOME}"/.zsh.d/*.zsh); do
        source "${ZSH_FILE}"
    done
fi

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GPG_TTY=${TTY}
export EDITOR=$(which vim)
export LOG_COLORS=cxgxdxhxcxhxBxdxCxGxHxxA
export LOG_STYLE=compact

# Change the xterm title to match our prompt
printf "\033]0;%s\007" "${HOST%%.*}"

# Allow for interactive comments
setopt interactivecomments

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit && compinit

