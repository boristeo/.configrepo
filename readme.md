My Config Files
===
Boris Teodorovich [`boristeo`]

Since I already spend too much time on this, I figured I might as well add a README.

## Overview
Whenever I'm not using a big IDE to plow through code, I use Vim. On the
surface, my changes do not stray far from vanilla, but there are a couple
mappings or other various improvements that make my life a lot easier and could
possibly do the same to you.

## Installation
Clone the repo into your home directory with
```
cd ~ && git clone --recurse-submodules https://github.com/boristeo/.configrepo.git
```
create symlinks to files in .configrepo in your home directory OR (if you happen
to trust my bad bash scripting skills) you can edit `list.txt` to contain only
those filenames that you want to create links to then run
```
~/.configrepo/install.sh
```
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
* A slightly less intrusive colorscheme than the default
* Unicode box-building chars for split separators
* Some custom snippets for LaTeX and C/C++
* autocmds for syntax error lists
* Custom statusline with Git branch for each buffer

### Tmux
Again, mostly vanilla. Improvements:
* Custom colors (less annoying than green)
* Tabs start from 1 for more logical navigation
* Custom status line

### Bash
* z completion
* Custom PS1 with Git integration
* LS colors bright red for broken links, red for archives

### Term color profiles
* Works nicely with everything else
* Terminal.app, Iterm2, GNOME Terminal
