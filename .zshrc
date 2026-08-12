export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS='di=01;36'
export GPG_TTY=${TTY}
export EDITOR=vim
export LOG_COLORS=cxgxdxhxcxhxBxdxCxGxHxxA
export LOG_STYLE=compact

# Completion directories must join FPATH before compinit reads it
typeset -U fpath
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
[[ -d "${HOME}/.docker/completions" ]] && fpath=("${HOME}/.docker/completions" $fpath)

autoload -Uz compinit && compinit

# Complete .py files for `uv run`
_uv_run_mod() {
  if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
    _arguments '*:filename:_files -g "*.py"'
  else
    _uv "$@"
  fi
}
type uv &>/dev/null && compdef _uv_run_mod uv

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Allow for interactive comments
setopt interactivecomments

# Shared with bash
for shared_file in "${HOME}"/.{aliases,functions}; do
  [[ -r "${shared_file}" ]] && source "${shared_file}"
done
unset shared_file

for zsh_file in "${ZDOTDIR:-$HOME}"/.zsh.d/*.zsh(N); do
  # local.zsh is sourced last so it can override anything above
  [[ "${zsh_file:t}" == local.zsh ]] && continue
  source "${zsh_file}"
done
unset zsh_file

local_zsh="${ZDOTDIR:-$HOME}/.zsh.d/local.zsh"
[[ -r "${local_zsh}" ]] && source "${local_zsh}"
unset local_zsh
