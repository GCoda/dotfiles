#!/bin/sh
# Check if got tools
command -v rsync >/dev/null 2>&1 || { echo >&2 "rsync it's not installed."; exit 1; }

# Simple function to write less, should add var to keep destination path in
b () { mkdir -p ~/github.dotfiles/$2 ; rsync -rtuc --exclude '.i3/layouts' --exclude "*node_modules*" $1 ~/github.dotfiles/$2 ; }

# Pacman, few user repos
# Nothing important
b /etc/pacman.conf /etc

# Config Files
b ~/.i3
b ~/.zshrc
b ~/.bashrc
b ~/.compton.conf
