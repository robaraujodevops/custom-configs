#!/bin/zsh

## CUSTOM OPTS
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

## MY ALIAS
source $ZDOTDIR/aliases

## LIBS
for config_file ($ZDOTDIR/lib/*.zsh); do
  if [ -f $config_file ]; then
    source $config_file
  fi
done

## PLUGINS
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

is_plugin() {
  local base_dir=$1
  local name=$2
  builtin test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || builtin test -f $base_dir/plugins/$name/_$name
}

for plugin ($plugins); do
  if ! is_plugin $ZDOTDIR $plugin ]; then
    if [[ "$plugin" =~ "zsh-" ]]; then
      git clone https://github.com/zsh-users/$plugin/ \
        $ZDOTDIR/plugins/$plugin
    fi
  fi 
done

# Load to fpath all plugins
for plugin ($plugins); do
  if is_plugin $ZDOTDIR $plugin; then
    fpath=($ZDOTDIR/plugins/$plugin $fpath)
  else
    echo "plugin '$plugin' not found"
  fi
done

# Init plugins
for plugin ($plugins); do
  if [ -f $ZDOTDIR/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZDOTDIR/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# USTOM PROMPT THEME
ZSH_THEME="pimped"

# Load the theme
if [ ! "$ZSH_THEME" = ""  ]; then
  source "$ZDOTDIR/themes/$ZSH_THEME.zsh-theme"
fi

## COMPLETION
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden file
source $ZDOTDIR/completion.zsh

## ENV VARS
ENV_FILE=$ZDOTDIR/.zshenv
if [ -f $ENV_FILE ]; then
  source $ENV_FILE
fi

## ENV VARS
XENV_FILE=$ZDOTDIR/.zshxenv
if [ -f $XENV_FILE ]; then
  source $XENV_FILE
fi

## NETrc
NETRC_FILE=~/.netrc
if [ ! -f $NETRC_FILE ]; then
  touch ~/.netrc
  chmod 600 ~/.netrc
  cat << EOF > ~/.netrc
  machine ${GITLAB_HOST} login ${GITLAB_USER} password ${GITLAB_TOKEN}
EOF
fi

unset NPM_CONFIG_PREFIX
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## BIND KEYS
bindkey -v
#bindkey '^R' history-incremental-search-backward
#
## FZF
## Fzf install
if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/roberto-araujo/google-cloud-sdk/path.zsh.inc' ]; then . '/home/roberto-araujo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/roberto-araujo/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/roberto-araujo/google-cloud-sdk/completion.zsh.inc'; fi
