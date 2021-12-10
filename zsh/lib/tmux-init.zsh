if [ -z "$TMUX" ]
then
  tmux new -s VPN -d;
  tmux send-keys -t VPN "sudo openvpn --config ~/client.ovpn" Enter
  tmux new -s DEV -d;
  tmux attach -t VPN;
fi