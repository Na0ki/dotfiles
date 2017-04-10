# PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Users/ahiru:$PATH
export LANG=ja_JP.UTF-8
export CC=/usr/bin/gcc

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#PROMPT="%{${fg[green]}%}[%n@%m]%~
#%{${reset_color}%} $ "
COLOR_FG="%{[38;5;202m%}"
PROMPT="${COLOR_FG}[%n@%m]%~
%{${reset_color}%} $ "
RPROMPT="%1(v|%F{green}%1v%f|)"

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# ls
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

########################################

autoload -Uz compinit
compinit -u

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
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt interactive_comments
setopt auto_pushd
setopt pushd_ignore_dups
setopt magic_equal_subst
setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt auto_menu
setopt extended_glob
setopt extended_history

bindkey '^R' history-incremental-pattern-search-backward

########################################

alias la='ls -a'
alias ll='ls -l'
alias ks='ls'
alias sl='ls'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias ipglobal='curl ifconfig.me'

alias sudo='sudo '
alias vi='vim '
alias unixtime='date +%s'
# alias lsusb="system_profiler SPUSBDataType"

# alias g='cd $(ghq root)/$(ghq list | peco)'
# alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# alias colorlist=`echo 'for c in {016..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($((c-16))%6)) -eq 5 ] && echo;done;echo'`

# cd後に自動ls
function chpwd() {
	ls
}

function command_not_found_handler() {
	echo "いやぁ〜乱世乱世"
}

#function genpdf() {
#    ptex2pdf -l $1 && ptex2pdf -l $1
#}

function _ssh {
  compadd `egrep '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf.d -type f 2>/dev/null) | egrep -v '[*?]' | awk '{print $2}' | sort`;
}


########################################
# function peco-history-selection() {
#         BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
#        CURSOR=$#BUFFER
#        zle reset-prompt
#}

# zle -N peco-history-selection
# bindkey '^R' peco-history-selection

########################################
case ${OSTYPE} in
    darwin*)
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        ;;
esac

if (which zprof > /dev/null) ;then
  zprof | less
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
