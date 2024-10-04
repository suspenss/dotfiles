PROMPT="%F{006}%n"
PROMPT+=" %F{015}at %F{006}%2~%f%F{006} %% "
# PROMPT+="%F{007}@%F{012}%m in %F{012}%2~%f%F{012} %% "
precmd() { echo }

# PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
# PROMPT+="$(git_prompt_info)"

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
