export LANG=en_US.UTF-8

export PATH=${PATH}:~/.tools

export EDITOR=vim
export PAGER=less

# Aliases
alias xcode='open -a /Applications/Xcode.app'
alias ll='ls -al'
alias tmux="tmux -2"
alias mc=". /usr/local/Cellar/midnight-commander/4.8.22/libexec/mc/mc-wrapper.sh"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline


# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'


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
            export PS1="\W \$(__git_ps1 '[git:%s] ')\$ "
        else
            export PS1="\[\033[1;36m\]\u@\h\[\033[1;00m\]:\[\033[1;34m\]\W \[\033[0;33m\]\$(__git_ps1 '\[\033[07m\]%s\[\033[0;00m\] ')\[\033[1;34m\]\$ \[\033[1;00m\]"
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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/boristeo/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/boristeo/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/boristeo/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/boristeo/Downloads/google-cloud-sdk/completion.bash.inc'; fi
