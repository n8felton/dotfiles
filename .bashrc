# ~/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

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
PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'