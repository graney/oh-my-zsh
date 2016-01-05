# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# 
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
RPROMPT="%{${_lineup}%}${git_info} %{$fg[white]%}[%*]%{${_linedown}%}"
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n\
%{$fg[white]%}@\
%{$fg[green]%}$(box_name)\
%{$fg[white]%}:\
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
