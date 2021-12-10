KUBECTL=/usr/local/bin/kubectl

if [[ -f "$KUBECTL" ]];then
  source <(kubectl completion zsh)
fi
