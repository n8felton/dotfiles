#  If the PROMPT_SUBST option is set, the prompt string is
#  first subjected to parameter expansion,
#  command substitution and arithmetic expansion.
setopt PROMPT_SUBST

PS1='%(#:%F{red}%n@%m%f:%F{green}%n%F{yellow}@%m%f)'
PS1+=':%F{cyan}%~%f %# '

set_terminal_title() {
	# Convert "${HOME}" to ~ for the title. Do not write to PWD; it is special.
	local dir="${PWD/#${HOME}/~}"

	# Change the xterm title to the hostname if we're in an SSH session.
	# Include the PWD
	if [[ -n "${SSH_CLIENT:-}" || -n "${SSH_TTY:-}" ]]; then
		printf "\033]0;%s | %s\007" "${HOST%%.*}" "${dir##*/}"
	else
		# This should be a localhost prompt, so exclude hostname
		printf "\033]0;%s\007" "${dir##*/}"
	fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd set_terminal_title
set_terminal_title

# High-contrast prompt for screen sharing. Call it; start a new shell to leave it.
presentation_mode() {
	# Prompt is green, typed text defaults to cyan
	PROMPT="%F{green}%% %F{cyan}"
	# Reset to the terminal default right before the command executes
	preexec() { echo -ne "\e[0m" }
}
