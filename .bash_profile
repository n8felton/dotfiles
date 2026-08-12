# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# .bashrc sources ~/.exports, ~/.aliases, ~/.functions, and ~/.extra
for file in ~/.{bashrc,bash_prompt,bash_aliases}; do
	[[ -r "$file" ]] && source "$file"
done
unset file
