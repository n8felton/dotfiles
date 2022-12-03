#  If the PROMPT_SUBST option is set, the prompt string is 
#  first subjected to parameter expansion, 
#  command substitution and arithmetic expansion.
setopt PROMPT_SUBST

PS1='%(#:%F{red}%n@%m%f:%F{green}%n%F{yellow}@%m%f)'
PS1+=':%F{cyan}%~%f %# '

chpwd() {
	# Convert "${HOME}" to ~ for PWD
	if [[ "${PWD}" == "${HOME}" ]]; then
		PWD="~"
	fi
	# Change the xterm title to the hostname if we're in an SSH session.
	# Include the PWD
	if [[ -n ${SSH_CLIENT} || -n ${SSH_TTY} ]]; then
		printf "\033]0;%s | %s\007" "${HOST%%.*}" "${PWD##*/}"
	else
		# This should be a localhost prompt, so exclude hostname
		if [[ ${0} == "-zsh" ]]; then
			printf "\033]0;%s\007" "${PWD##*/}"
		fi
	fi
}
