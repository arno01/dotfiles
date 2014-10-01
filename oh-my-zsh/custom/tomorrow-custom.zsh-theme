# based on af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:		June 19, 2012
# Last modified on:	June 20, 2012



if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[239]------------------------------------------------------------%{$reset_color%}
$FG[001]%~\
$(git_prompt_info) \
$FG[004]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# color vars
eval my_gray='$FG[239]'

# Show vi mode
function zle-line-init zle-keymap-select {
  # right prompt
  HOSTNAME='%n@%m%'
  RPROMPT="$my_gray${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT} | $HOSTNAME{$reset_color%}"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[006] ["
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[003]*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[006]]%{$reset_color%}"
