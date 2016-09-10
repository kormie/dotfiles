unsetopt HIST_VERIFY
battery=`echo -n "\xF0\x9F\x94\x8B"`
batteryPack() {
  echo "$FG[238]$battery $(echo $(battery_pct))%%"
}
if [[ %? != 0 ]]; then
    codeface=`echo -n "\xF0\x9F\x96\x95"`
fi
isSmallerRPromptReduced () {
  right=$(pwd)
  right=${right#'/Users/Kormie/'}
  right=${right#'/Users/Kormie'}
  rightCount=${#right}
  fraction=$(echo "scale=3 ; $rightCount/$COLUMNS" | bc)
  if [[ "$fraction" -gt .4 ]]; then
    return 0
  fi
  return 1
}
isReduced () {
  if [[ "$COLUMNS" -lt 54 ]]; then
    return 0
  fi
  return 1
}
leftSide() {
  if isReduced ; then
    echo "$(batteryPack) "
  else
    echo '    '
  fi
}
rightSide() {
  if isSmallerRPromptReduced ; then
    if isReduced ; then
      echo "$(git_prompt_info)"
    else
      echo "$(batteryPack)"
    fi
  else
    echo "%~ $(batteryPack)"
  fi
}
gitSection() {
  if isReduced ; then
    echo ''
  else
    echo " $(git_prompt_info)"
  fi
}
cursor(){
  if isReduced ; then
    echo "%{${fg[cyan]}%}:%{$reset_color%}"
  else
    echo " %{$fg[red]%}⧴ %{$reset_color%}"
  fi
}


PROMPT='$(leftSide)%{${fg[cyan]}%}%.%{$reset_color%}$(gitSection)%(?,,%{$fg_bold[white]%}%{$fg[red]%}$codeface%{$reset_color%})$(cursor)'
RPROMPT='%{$fg[green]%}$(rightSide)%{$reset_color%}%{$reset_color%}'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}] %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[yellow]%}] %{$fg[green]%}✓"
