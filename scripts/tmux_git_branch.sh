#!/bin/bash
dir=$(tmux display -p '#{pane_current_path}')
if [ -d "$dir/.git" ] || git -C "$dir" rev-parse --is-inside-work-tree &>/dev/null; then
  git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null | awk '{print " " $1}'
fi
