# ~/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# .extra is host-local and untracked; it loads last so it can override
for file in ~/.{exports,aliases,functions,extra}; do
	[[ -r "$file" ]] && source "$file"
done

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS='di=01;36'
export GPG_TTY=$(tty)
export EDITOR=vim
export LOG_COLORS=cxgxdxhxcxhxBxdxCxGxHxxA
export LOG_STYLE=compact

complete -cf sudo

if [ $EUID = 0 ]; then
	PS1='\[\e[31m\]\u@\h\[\e[0m\]:\[\e[36m\]\w\[\e[00m\] \$ '
	alias rm='rm -i'
	alias cp='cp -i'
	alias mv='mv -i'
else
	PS1='\[\e[32m\]\u\[\e[33m\]@\h\[\e[0m\]:\[\e[36m\]\w\[\e[00m\] \$ '
fi

# Change the xterm title to match our prompt
printf "\033]0;%s\007" "${HOSTNAME%%.*}"

