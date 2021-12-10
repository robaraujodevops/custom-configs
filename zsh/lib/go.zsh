GOBIN=/usr/local/go/bin

if [[ -d "$GOBIN" ]]; then
  export PATH=$PATH:$GOBIN
fi
