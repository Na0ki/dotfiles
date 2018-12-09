#!/bin/zsh

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
fi

function command_not_found_handler() {
  echo "いやぁ〜乱世乱世！三世紀初めの大陸の話でゴザ… $0"
}

if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

add-zsh-hook chpwd _chpwd
function _chpwd() {
	ls
}

function g() {
  add-zsh-hook -d chpwd _chpwd
  cd $(ghq root)/$(ghq list | peco)
  if [ $(ghq root) = $(pwd) ]; then
    cd - >& /dev/null
  fi
  add-zsh-hook chpwd _chpwd
}
