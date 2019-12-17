#!/bin/bash

# kubectl and kops autocompelte
which kubectl > /dev/null && . <(kubectl completion bash)
which kops > /dev/null && . <(kops completion bash)

# alias
alias k=kubectl
complete -F __start_kubectl k

# select k8s namespace
function kns() {
  kubectl config set-context --current --namespace=$(kubectl get namespaces --output=jsonpath='{range .items[*]}{.metadata.name}{"\n"}'|fzf)
}

# get k8s resources, default to pods
function krs() {
  kubectl get ${1:-pods} --output=jsonpath='{range .items[*]}{.metadata.name}{"\n"}'
}

# just an alias to use krs
function kpods() {
  krs
}

# use fzf to auto complete resource type for krs
function _krs_completion() {
  COMPREPLY=( $(kubectl api-resources -o name| fzf) )
}
complete -F _krs_completion krs

# shorthand for k exec -ti <pod-name> -- ..., using fzf to select the pod
function kexec() {
  kubectl exec -ti $(krs| fzf) -- $@
}

# shorthand for k logs -f <pod-name> <container-name>, using fzf to select the pod
function klogs() {
  kubectl logs -f $(krs| fzf) $1
}

# shorthand for k describe <resource-type> <resource-name>, type defaults to pod and using fzf to select the resource
function kdr() {
  kubectl describe ${1:-pod} $(krs ${1:-pod}| fzf)
}
