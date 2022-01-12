if [ -z "$TMUX" ]
then
  tmux -u new -s VPN -d;
  tmux send-keys -t VPN "sudo openvpn --config ~/client.ovpn" Enter
  tmux send-keys -t VPN "$(2fa openvpn)" Enter
  tmux -u new -s DEV -d;
  tmux attach -t VPN;
fi

python3 ~/Projects/custom-configs/automation/init-chrome.py > /dev/null 2>&1
