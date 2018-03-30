# PATH
export LANG=ja_JP.UTF-8
# gcc
export CC=/usr/bin/gcc
fpath=(/usr/local/share/zsh-completions $fpath)
# ls
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

REPORTTIME=3

autoload -Uz add-zsh-hook
autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

COLOR_FG="%{[38;5;202m%}"
PROMPT="${COLOR_FG}[%n@%m]%~
%{${reset_color}%} $ "
RPROMPT="%1(v|%F{green}%1v%f|)"

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


########################################

autoload -Uz compinit
compinit -C

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


########################################
setopt print_eight_bit # show japanese filename
setopt no_beep # don't use beep
setopt no_flow_control # disable flow control (ctrl+s,ctrl+q)
setopt interactive_comments # use comment on commandline
setopt auto_pushd # push cd history(`cd -[tab]` to show history)
setopt pushd_ignore_dups

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

########################################

alias la='ls -a'
alias ll='ls -l'
alias ks='ls'
alias sl='ls'
alias less='less -R '
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias vi='vim '
alias unixtime='date +%s'
alias grep='grep --color=auto'

#alias g='cd ${HOME}/ghq/$(ghq list | peco)'
function g() {
  add-zsh-hook -d chpwd _chpwd
  cd $(ghq root)/$(ghq list | peco)
  if [ $(ghq root) = $(pwd) ]; then
    cd - >& /dev/null
  fi
  add-zsh-hook chpwd _chpwd
}

# alias colorlist=`echo 'for c in {016..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($((c-16))%6)) -eq 5 ] && echo;done;echo'`

alias gco='git checkout $(git branch -a | grep -v -- "->" | peco --prompt "select branch>" | sed -e "s/\* //g" | sed -e s%remotes/origin/%% | awk "{print \$1}")'

if [[ -x `which colordiff` ]]; then
    alias diff='colordiff -u'
fi

# cd後に自動ls
add-zsh-hook chpwd _chpwd
function _chpwd() {
	ls
}

function command_not_found_handler() {
	echo "いやぁ〜乱世乱世！三世紀初めの大陸の話でゴザ… $0"
}

########################################
function peco-history-selection() {
        BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
        CURSOR=$#BUFFER
        zle reset-prompt
}

zle -N peco-history-selection
# bindkey '^R' history-incremental-pattern-search-backward
bindkey '^R' peco-history-selection

########################################
case ${OSTYPE} in
    darwin*)
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        ;;
esac

# load additional settings
[ -f ~/.zshrc.local ] && source $HOME/.zshrc.local

