#!/bin/bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install vim
brew install tmux
brew install coreutils
brew install findutils
brew install tidy-html5
brew install urlview
brew install bash-completion
brew install z

brew tap koekeishiya/formulae
brew install chunkwm
brew install koekeishiya/formulae/skhd
#brew services start skhd
#brew services start chunkwm

git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false
git config --global alias.dt difftool
