#!/bin/bash

# history size
export HISTSIZE=100000
export HISTFILESIZE=100000

# set history to append mode
shopt -s histappend
# append to history after each command
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
