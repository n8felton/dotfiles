# Enable aliases to be sudo.ed
alias sudo='sudo '

# Color!
alias ls='command ls --color=auto'
alias grep='command grep --color=auto'

# Command Shortcuts
# Directory Listings
alias ll='ls -alh'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Faster directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# IP Addresses
alias remoteip='dig +short -4 myip.opendns.com @resolver1.opendns.com'
alias remoteip6='dig +short -6 myip.opendns.com AAAA @resolver1.ipv6-sandbox.opendns.com'

# macOS Aliases
if [[ "$OSTYPE" =~ ^darwin ]]; then
	source .aliases_macos
fi

# Allow for dotfiles to be updated
alias dotfiles_update='cd ~ && curl -Lk# https://github.com/n8felton/dotfiles/tarball/master | tar --strip-components 1 -xz && source .bash_profile'
