#!/bin/bash
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1
apt install ctags
