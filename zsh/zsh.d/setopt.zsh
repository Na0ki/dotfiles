#!/bin/zsh

setopt print_eight_bit # show japanese filename
setopt no_beep # don't use beep
setopt no_flow_control # disable flow control (ctrl+s,ctrl+q)
setopt interactive_comments # use comment on commandline
setopt auto_pushd # push cd history(`cd -[tab]` to show history)
setopt pushd_ignore_dups
setopt correct # is it?
setopt prompt_subst

# history
setopt share_history # share history between sessions
setopt hist_ignore_all_dups # don't record duplicate commands
setopt hist_save_no_dups # don't record duplicate commands in history
setopt inc_append_history # record histories incrementally
setopt hist_ignore_space # rm commands start with space from history
setopt hist_reduce_blanks # rm redundant blanks from history
setopt extended_history # add executed date
setopt hist_no_store # don't record history command

# completion
setopt auto_menu
setopt list_types
setopt list_packed

# file glob
setopt extended_glob
setopt glob_dots
setopt magic_equal_subst # completes --hoge=***
