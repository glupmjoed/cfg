#!/bin/bash

export EDITOR="emacs -nw"
export PATH=$PATH:$HOME/bin

# Disable XON/XOFF flow control (Ctrl+S/Ctrl+Q) in interactive shell sessions
# This avoids accidental freezing of output and frees Ctrl+S for GNU Readline
[[ $- = *i* ]] && stty -ixon

# Go stuff
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME

# Linuxbrew
export PATH=$PATH:$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin
