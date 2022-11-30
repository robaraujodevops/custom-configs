function createVPNSession () {
  tmux -u new -s VPN -d;
  sleep 1
  tmux send-keys -t VPN "vpn-start" Enter
  sleep 1
  tmux send-keys -t VPN "while ! netstat -i | grep tun0; do echo Waiting tun0 interface!; sleep 1; done; sudo resolvectl dns tun0 10.10.10.2" Enter
}

function createDEVSession () {
  tmux -u new -s DEV-1 -d;
  tmux a -t DEV-1;
}

function appendDEVSession () {
  DEV_SESSIONS=$(grep 'DEV' <<< "$TMUX_SESSIONS" | wc -l)
  if [[ $DEV_SESSIONS -ge 1 ]]; then
    NEW_SESSION="DEV-$((++DEV_SESSIONS))"
    tmux -u new -s "${NEW_SESSION}" -d;
    tmux a -t "${NEW_SESSION}";
  else
    tmux a -t DEV-1;
  fi
}

function initDev () {
  local TMUX_SESSIONS=$([[ ! -z $TMUX ]] && echo $(tmux ls -F "#{session_name}") || echo "")
  
  if [ -z $TMUX_SESSIONS ]; then 
    if ! [[ $TMUX_SESSIONS =~ "VPN" ]]; then
      createVPNSession
    fi
    if ! [[ $TMUX_SESSIONS =~ "DEV" ]]; then
      createDEVSession
    fi
  else
    if ! [[ $TMUX_SESSIONS =~ "VPN" ]]; then
      createVPNSession
    fi
    if ! [[ $TMUX_SESSIONS =~ "DEV" ]]; then
      createDEVSession
    else
      if [[ $1 && $1 == "a" ]]; then; appendDEVSession; fi
    fi
  fi
}
