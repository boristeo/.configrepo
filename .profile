#!/bin/sh

if [ -t 1 ]; then
  stty -ixon -ixoff
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export VISUAL=vim
export EDITOR=vim
export PAGER=less

alias vi=vim
alias grep="grep --color=auto"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls="ls --color=auto"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls="ls -G"
fi


if [ -f ~/.colors.sh ]; then
  source ~/.colors.sh
else
  export HI_COLOR=14
fi

if test -n "$ZSH_VERSION"; then
  git_prompt() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*.\(\)/\1/'`

    if [ ! -z $BRANCH ]; then
      echo -n " %S%F{11}$BRANCH%s"
    fi
  }
  setopt PROMPT_SUBST
  PS1='%B%n@%M %F{14}%~$(git_prompt) %F{15}%# %b%F{reset}'
elif test -n "$BASH_VERSION"; then
  git_prompt() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*.\(\)/\1/'`
    if [ ! -z $BRANCH ]; then
      echo -e "\033[33;7m$BRANCH\033[0m "
    fi
  }
  PS1='\[\033[0;1m\]\u@\h\[\033[0;1m\] \[\033[1;36m\]\w $(git_prompt)\[\033[0;1m\]\$ \[\033[0m\]'
fi

