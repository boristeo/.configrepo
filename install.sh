#!/bin/bash

# Get directory of this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Make symlinks to all files documented in list.txt
while read p; do
  if [ -e $p ]
then
    echo $p
    ln -s "$DIR"/"$p" ~
else
    echo "$p not found"
fi
done <"$DIR"/list.txt
