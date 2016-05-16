# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

for file in ~/.{bashrc,extra,bash_prompt,bash_aliases,exports,aliases,functions}; do
	[[ -r "$file" ]] && source "$file"
done
unset file
