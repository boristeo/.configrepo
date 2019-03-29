My Config Files
===
Boris Teodorovich `boristeo`

Since I already spend too much time on this, I figured I might as well add a README.

## Overview
Whenever I'm not using a big IDE to plow through code, I use Vim. On the
surface, my changes do not stray far from vanilla, but there are a couple
mappings or other various improvements that make my life a lot easier and could
possibly do the same to you.

## Installation
`cd` to your home directory. Clone the repo with
```
git clone --recurse-submodules https://github.com/boristeo/.configrepo.git
```
create symlinks to files in .configrepo in your home directory OR (if you happen
to trust my bad bash scripting skills) you can edit `list.txt` to contain only
those filenames that you want to create links to then run
```
~/.configrepo/install.sh
```
If you are running Mac OS, you can also run
```
~/.configrepo/ADDITIONAL.sh
```
to install helpful tools and applications that are used by the other programs
included with this configuration.
