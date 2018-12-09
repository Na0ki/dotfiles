#!/bin/zsh

autoload -Uz colors
colors

PROMPT="%{[38;5;069m%}[%n@%m]%~
%{${reset_color}%} $ "
RPROMPT="%1(v|%F{green}%1v%f|)"

# version control infomations
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
function _precmd_vcs_info() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _precmd_vcs_info
