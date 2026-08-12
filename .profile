# Read by sh, and by bash only when .bash_profile is absent. Keep this file POSIX.
if [ -n "$BASH_VERSION" ] && [ -r "$HOME/.bash_profile" ]; then
	. "$HOME/.bash_profile"
fi
