#  If the PROMPT_SUBST option is set, the prompt string is 
#  first subjected to parameter expansion, 
#  command substitution and arithmetic expansion.
setopt PROMPT_SUBST

PS1='%(#:%F{red}%n@%m%f:%F{green}%n%F{yellow}@%m%f)'
PS1+=':%F{cyan}%~%f %# '

precmd() {
	# Change the xterm title to the hsotname
	printf "\033]0;%s\007" "${HOST%%.*}"
}
