vim_ins_mode="%{$fg[white]%}%{$fg_bold[blue]$bg[white]%} INSERT %{$reset_color%}"
MODE_INDICATOR="%{$fg[green]%}%{$fg_bold[black]$bg[green]%} COMMAND %{$reset_color%}"

PROMPT='%{$fg_bold[white]%}λ %{$fg_bold[green]%}[ %{$fg[white]%}%n %{$fg_bold[green]%}] %{$fg[cyan]%}%4~ %{$fg_bold[white]%}$(git_prompt_info)%{$fg_bold[white]%} % %{$fg_bold[red]%}➜ %{$reset_color%}'


RPS1='$(vi_mode_prompt_info) ${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}) %{$fg_bold[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%})"
