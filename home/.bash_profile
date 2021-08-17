# .bash_profile

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc



# User specific environment and startup programs
# git bash prompt
GIT_PROMPT_ONLY_IN_REPO=0
[[ -f ~/.bash-git-prompt/gitprompt.sh ]] && . ~/.bash-git-prompt/gitprompt.sh

# fzf
[[ -f /usr/share/doc/fzf/examples/key-bindings.bash ]] && . /usr/share/doc/fzf/examples/key-bindings.bash
[[ -f /usr/share/doc/fzf/examples/completion.bash ]] && . /usr/share/doc/fzf/examples/completion.bash

# complete alias
[[ -f ~/.complete-alias/complete_alias ]] && . ~/.complete-alias/complete_alias

# load k8s functions and auto-compeletion
[[ -f ~/.k8s.bash ]] && . ~/.k8s.bash

# load gcloud functions
[[ -f ~/.gcloud.bash ]] && ~/.gcloud.bash

# load shared functions
[[ -f ~/.functions.bash ]] && . ~/.functions.bash

# load settings for history
[[ -f ~/.history.bash ]] && . ~/.history.bash

# flux auto completion
flux >/dev/null && . <(flux completion bash)

# load secret envs
[[ -f ~/.envs.bash ]] && . ~/.envs.bash
