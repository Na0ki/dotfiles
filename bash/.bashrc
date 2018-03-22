#HISTORY
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT='%Y%m%d %T' # history time format
export HISTIGNORE='history:pwd:ls:' # commands not to save
shopt -s histappend
shopt -s cmdhist # multiline cmd to one line in history

parse_git_branch() {
    git branch 2> /dev/null|sed -e '/^[^*]/d' -e 's/* \(.*\)/ (git)-[\1]/'
}

#DO ls AFTER cd
cdls () {
    \cd "$@" && ls
}
alias cd="cdls"

command_not_found_handle() {
    echo "いやぁ〜乱世乱世！三世紀初めの大陸の話でゴザ… $1"
}

#ALIAS
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

#PROMPT
export PS1="\[\e[1;36m\][\u@\h]\W\[\e[00m\]\n\e[0;32m\$(parse_git_branch)\e[00m $ "
PROMPT_COMMAND="history -a; history -c; history -r"

