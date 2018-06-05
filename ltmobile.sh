#!/bin/bash

cd ~/letote/letote

tmux new-session -d -s "Le Tote Mobile"

tmux rename-window -t "Le Tote Mobile":1 "Zeus Server"
tmux new-window -t "Le Tote Mobile":2 -n "Rails Server"
tmux new-window -t "Le Tote Mobile":3 -n "Rails Console"

tmux send-keys -t "Le Tote Mobile":1 "zeus start" Enter
tmux send-keys -t "Le Tote Mobile":2 "zeus s" Enter
tmux send-keys -t "Le Tote Mobile":3 "zeus c" Enter

cd ~/letote/letote_mobile_ios

tmux new-window -t "Le Tote Mobile":4 -n "Terminal"
tmux send-keys -t "Le Tote Mobile":4 "xc" Enter

tmux select-window -t "Le Tote Mobile":3
tmux select-window -t "Le Tote Mobile":4
tmux attach-session -d -t "Le Tote Mobile" -c ~/letote/letote_mobile_ios/



