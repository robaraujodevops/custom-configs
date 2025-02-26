#!/bin/bash
set -x

url=$(tmux capture-pane -t 0 -pJS -10 | grep -oE 'https?://.+remote' | tail -n 1)

yes | gcloud auth login --remote-bootstrap="${url}" 2>&1 | grep -E 'https://localhost'
