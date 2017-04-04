#PROMPT
export PS1="\[\e[1;36m\][\u@\h]\W\[\e[00m\]\n\$ "

#HISTORY
#export HISTCONTROL=ignoreboth
export HISTCONTROL=erasedups
HISTTIMEFORMAT='%Y%m%d %T';
export HISTTIMEFORMAT

#DO ls AFTER cd
cdls () {
    \cd "$@" && ls
}
alias cd="cdls"

#ALIAS
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
