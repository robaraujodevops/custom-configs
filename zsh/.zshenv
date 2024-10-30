export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export ZDOTDIR="$HOME/workspace/custom-configs/zsh"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

export HISTFILE="$HOME/.zhistory"           # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"

# golang
export GOPATH="$HOME/workspace/go"
export GOBIN="$HOME/workspace/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"


# PATH
export PATH="$COMPOSER_HOME/vendor/bin:$PATH"                       # COMPOSER
export PATH="$GOBIN:$PATH"                                          # GOBIN
export PATH="$NPM_BIN:$PATH"                                        # NPM
export PATH="/opt/nvim-linux64/bin:$PATH"

# SSH_PRIVATE_KEY
export SSH_PRIVATE_KEY=$(cat ~/.ssh/id_ed25519)
export SESSION_LOGIN=Y

#GO
export GO111MODULE=on
