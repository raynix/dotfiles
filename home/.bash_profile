# .bash_profile

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc



# User specific environment and startup programs
# git bash prompt
GIT_PROMPT_ONLY_IN_REPO=0
[[ -f ~/.bash-git-prompt/gitprompt.sh ]] && . ~/.bash-git-prompt/gitprompt.sh

# fzf
[[ -f /usr/share/fzf/shell/key-bindings.bash ]] && . /usr/share/fzf/shell/key-bindings.bash


# load k8s functions and auto-compeletion
[[ -f ~/.k8s.bash ]] && . ~/.k8s.bash

# load shared functions
[[ -f ~/.functions.bash ]] && . ~/.functions.bash

# load settings for history
[[ -f ~/.history.bash ]] && . ~/.history.bash
