export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

export PATH=${PATH}:~/.scripts

export VISUAL=vim
export EDITOR=vim
export PAGER=less

# Aliases
if [ -x "$(command -v /usr/local/bin/vim)" ]; then
alias vi=/usr/local/bin/vim
alias vim=/usr/local/bin/vim
fi

alias ls="ls --color"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export LESSHISTFILE=-

export LS_COLORS+=":or=31;1:*.zip=31:*.gz=31:*.bz2=31"


# Sourcing additional plugins
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
	export PS1="\[\033[0;1m\]\u@\h\[\033[0;1m\]:\[\033[1;36m\]\w \$(__git_ps1 '\[\033[33;7m\]%s\[\033[0m\] ')\[\033[0;1m\]\$ \[\033[0m\]"
fi


if [ -f /usr/local/etc/profile.d/z.sh ];
then
	. /usr/local/etc/profile.d/z.sh
fi

