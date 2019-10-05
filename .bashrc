if [ -t 1 ] ; then
  stty -ixon -ixoff
fi

export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

export PATH=${PATH}:~/.scripts

export VISUAL=vim
export EDITOR=vim
export PAGER=less

if [ -x "$(command -v /usr/local/bin/vim)" ]; then
alias vi=/usr/local/bin/vim
alias vim=/usr/local/bin/vim
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls="ls --color=auto"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls="ls -G"
fi

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


if test -n "$ZSH_VERSION"; then
  git_prompt() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*.\(\)/\1/')
    if [ ! -z $BRANCH ]; then
      echo -n "%S%F{11}$BRANCH%s "
    fi
  }
  setopt PROMPT_SUBST
  PS1=$'%F{15}%B%n@%M %F{14}%~ $(git_prompt)%F{15}%# %b%F{reset}'
elif test -n "$BASH_VERSION"; then
  git_prompt() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*.\(\)/\1/')
    if [ ! -z $BRANCH ]; then
      echo -e "\033[93;7m$BRANCH\033[0m "
    fi
  }
  PS1='\[\033[0;1;97m\]\u@\h\[\033[0;1m\] \[\033[1;96m\]\w $(git_prompt)\[\033[0;1;97m\]\$ \[\033[0m\]'
fi
