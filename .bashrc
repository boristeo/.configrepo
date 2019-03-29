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

if [ -x "$(command -v gls)" ]; then
alias ls='gls --color=auto'
alias ll='gls -al --color=auto'
else
alias ll='ls -al'
alias ls='ls -G'
fi


# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

export LS_COLORS+=":or=31;1:*.zip=31:*.gz=31:*.bz2=31"


# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Config
stty -ixon -ixoff


# Sourcing additional plugins

which -s brew
if [[ $? != 0 ]];
then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

which -s brew
if [[ $? == 0 ]];
then
    if [ -f /usr/local/etc/bash_completion ];
    then
        . /usr/local/etc/bash_completion
        source /usr/local/etc/bash_completion.d/git-prompt.sh
    else
        brew install bash-completion
        echo "Installed bash-completion. Restart terminal to see effects."
    fi

    if [ -f /usr/local/etc/gitconfig ];
    then
        if ps $PPID |grep mc; then
            export PS1="\w \$(__git_ps1 '[git:%s] ')\$ "
        else
			export PS1="\[\033[0m\]\u@\h\[\033[0m\]:\[\033[1;36m\]\w \$(__git_ps1 '\[\033[33;7m\]%s\[\033[0m\] ')\[\033[0m\]\$ \[\033[0m\]"
        fi
    else
        brew install git
        echo "Installed git."
    fi


    if [ -f /usr/local/etc/profile.d/z.sh ];
    then
        . /usr/local/etc/profile.d/z.sh
    else
        brew install z
        echo "Installed z. Restart terminal to see effects."
    fi
fi

