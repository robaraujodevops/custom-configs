#!/bin/zsh
if [ -z "$TMUX" ]; then
  TMUX_SESSIONS=$(tmux ls -F "#{session_name}")
  if ! [[ $TMUX_SESSIONS =~ "VPN" ]]; then
    tmux -u new -s VPN -d;
    tmux send-keys -t VPN "sudo openvpn --config ~/client.ovpn" Enter
    tmux send-keys -t VPN "$(2fa openvpn)" Enter
  fi

  if ! [[ $TMUX_SESSIONS =~ "DEV" ]]; then
    tmux -u new -s DEV-1 -d;
    tmux a -t DEV-1;
  else
    DEV_SESSIONS=$(grep 'DEV' <<< "$TMUX_SESSIONS" | wc -l)
    if [[ $DEV_SESSIONS -ge 1 ]]; then
      NEW_SESSION="DEV-$((++DEV_SESSIONS))"
      tmux -u new -s "${NEW_SESSION}" -d;
      tmux a -t "${NEW_SESSION}";
    else
      tmux a -t DEV-1;
    fi
  fi
fi

python3 ~/Projects/custom-configs/automation/init-chrome.py > /dev/null 2>&1
