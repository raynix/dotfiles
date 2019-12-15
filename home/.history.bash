#!/bin/bash

# set history to append mode
shopt -s histappend
# append to history after each command
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
