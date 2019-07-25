if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Users/boristeo/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


