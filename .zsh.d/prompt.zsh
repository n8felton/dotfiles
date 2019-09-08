if [ $EUID -eq 0 ]; then
	PROMPT='%F{red}%n@%m%f:%F{cyan}%~%f %# '
else
	PROMPT='%F{green}%n%F{yellow}@%m%f:%F{cyan}%~%f %# '
fi
