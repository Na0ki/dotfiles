#!/bin/zsh
if [ -e "$HOME/.profile" ]; then
  source "$HOME/.profile"
fi

function require() {
  for i; do
    if [ -f "$HOME/.zsh.d/$i.zsh" ]; then
      source "$HOME/.zsh.d/$i.zsh"
    else
      echo "$i.zsh not found. skipping..."
    fi
  done
}

export LANG=ja_JP.UTF-8
export SHELL=/bin/zsh
export EDITOR=/usr/bin/vim

require prompt
require compinit
require ls
require setopt
require aliases
require historiez
require peco
require direnv
require util
require env/init

if [[ $OSTYPE =~ "darwin*" ]]; then
  require mac/init
elif [ $OSTYPE = "linux*"]; then
  require linux/init
fi
