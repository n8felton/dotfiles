# If not running interactively, don't do anything
[ -z "$PS1" ] && return

for file in ~/.{extra,bash_prompt,bash_aliases,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

complete -cf sudo

if [ `id -u` = 0 ]; then
	PS1='\[\e[31;1m\]\u\]@\h\[\e[0m\]:\[\e[34;1m\]\w\[\e[00m\] \$ '
	alias rm='rm -i'
	alias cp='cp -i'
	alias mv='mv -i'
else
	PS1='\[\e[32;1m\]\u\[\e[36;1m\]@\h\[\e[0m\]:\[\e[34;1m\]\w\[\e[00m\] \$ '
fi
