PROMPT='%(#:%F{red}%n@%m%f:%F{green}%n%F{yellow}@%m%f)'
PROMPT+=':%F{cyan}%~%f %# '

RPROMPT='$(git_super_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="" # "("
ZSH_THEME_GIT_PROMPT_SUFFIX="" # ")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH=" %{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

