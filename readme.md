My Config Files
===
Since I already spend too much time on this, I figured I might as well add a README.

## Installation
Clone the repo into your home directory with
```
cd ~ && git clone https://github.com/boristeo/.configrepo.git
```
create symlinks to files in .configrepo in your home directory OR (if you happen
to trust my bash scripting skills) you can run
```
~/.configrepo/install.sh
```
which symlinks all files listed in `list.txt` in your home directory. 

If you are running Mac OS, you can also run
```
~/.configrepo/MAC_ADDITIONS.sh
```
to install helpful tools and applications that are used by the other programs
included with this configuration.

## Features
### Vim
Staying true to the nature of Vim, only a minimal amount of plugins and
mappings that do not interfere with the default ones. The improvements
are:
* Some custom snippets for LaTeX
* Custom statusline with Git branch for each buffer
* (optional) A slightly less intrusive colorscheme than the default

### Tmux
Again, mostly vanilla. Improvements:
* Custom colors (less annoying than green)
* Tabs start from 1 for more logical navigation
* Custom status line

### Bash / Zsh
* Custom PS1 with Git integration
