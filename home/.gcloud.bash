#!/bin/bash

# The next line enables shell command completion for gcloud.
if [ -f '/Users/admzl53/.google-cloud-sdk/completion.bash.inc' ]; then
  . '/Users/admzl53/.google-cloud-sdk/completion.bash.inc'
  alias g=gcloud
  complete -F _complete_alias g
fi

function gplist() {
  gcloud projects list --format json|jq -r .[].projectId
}

function gp() {
  gcloud config set project $(gplist | fzf)
}
