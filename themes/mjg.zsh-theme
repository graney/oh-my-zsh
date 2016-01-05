# a copy of ys theme, but with some personal changes around positioning of the git prompt

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# special control characters
_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# Prompt format: \n # USER at MACHINE in DIRECTORY  git:BRANCH STATE [DATE][TIME] \n $ 
RPROMPT="%{${_lineup}%}${git_info} %{$fg[white]%}[20%D][%T]%{${_linedown}%}"
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n\
%{$fg[white]%}@\
%{$fg[green]%}$(box_name)\
%{$fg[white]%}:\
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
