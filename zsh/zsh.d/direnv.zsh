#!/bin/zsh

if which direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi
