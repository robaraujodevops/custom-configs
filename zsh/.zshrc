#!/bin/zsh

## CUSTOM OPTS
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

## FZF
if [ $(command -v "fzf") ]; then
    source ~/.fzf.zsh

    # Search with fzf and open selected file with Vim
    bindkey -s '^v' 'vim $(fzf);^M'
fi

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

## CUSTOM PROMPT THEME
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

## BIND KEYS
bindkey -v
#bindkey '^R' history-incremental-search-backward
