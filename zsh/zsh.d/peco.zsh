#!/bin/zsh

function peco-history-selection() {
  local tac
  if which tac > /dev/null; then
    tac='tac'
  else
    tac='tail -r'
  fi
  BUFFER=`history -n 1 | eval $tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
