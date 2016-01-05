# A modification of the ys theme to adhere to my personal tastes

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname
}

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

function git_info(){
	local info='$(git_prompt_info) %{$fg[white]%}[%*]'
	echo -n $info;
}

# prompt info
function prompt_info() {
	local info="%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} %{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}$(box_name)%{$fg[white]%}:%{$terminfo[bold]$fg[yellow]%}$(PWD)%{$reset_color%}"
	echo -n $info
}

function put_spacing() {
  # will return all the chars, including non printable, so figure out length-nonprintable
  local git=$(git_info)
  if [ ${#git} != 0 ]; then
      ((gitl=${#git} - 11))
  else
      gitl=0
  fi

  # will return all the chars, including non printable, so figure out length-nonprintable
  local prom=$(prompt_info)
  if [ ${#prom} != 0 ]; then
      ((proml= ${#prom} - 79))
  else
      proml=0
  fi

  local termwidth
  (( termwidth = ${COLUMNS} - ${proml} - ${gitl} ))
	# echo ""
  local spacing=""
  for i in {1..${termwidth}}; do
      spacing="${spacing} "
  done
  echo -n $spacing
}

PROMPT="$(prompt_info)$(put_spacing)$(git_info)
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"


# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $ 
# RPROMPT="${git_info} %{$fg[white]%}[%*]"
# PROMPT="
# %{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
# %{$fg[cyan]%}%n\
# %{$fg[white]%}@\
# %{$fg[green]%}$(box_name)\
# %{$fg[white]%}:\
# %{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}
# %{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
