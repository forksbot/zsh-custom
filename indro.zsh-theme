# Indro's prompt
# http://indrode.com/

# features:
# - signals when previous command returned error
# - current battery charge status
# - time
# - zsh history number
# - free space
# - git branch and clean/dirty status
# - readjusts on window resize

# ✈ pr0xy@unagi11 ~/Documents % ⚡                       ●●●●●●●○○○ [15:03:13] 510 22G
#     |      |        |         |                           |          |       |    |
#  username  |       path       |                     battery charge   |   history  |
#          host            error marker                              time     available space

local returned_error="%(?..%{$fg[red]%}⚡ %{$reset_color%})"

function battery_charge {
  #python ~/Projects/code/python/batcharge.py
}

function horizontal_line {
  local termwidth
  (( termwidth = $COLUMNS - 1 ))
  printf '—%.0s' {1..$termwidth}
}

function available_disk_space {
  df -H | grep disk1 | tr -s ' ' '.' | cut -d '.' -f4
  # df -H | grep disk0s2 | tr -s ' ' '.' | cut -d '.' -f4
  # TODO: use config file to determine hard drive name
}

PROMPT='
%{$FG[240]%}$(horizontal_line)
%{$fg[yellow]%}✈ %{$fg_bold[green]%} %~$(git_prompt_info) %{$fg_bold[yellow]%}%%%{$reset_color%}%b ${returned_error}'

RPROMPT='$(battery_charge) %{$fg[yellow]%}[%*]%{$reset_color%} %! %{$fg[magenta]%}$(available_disk_space)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"


