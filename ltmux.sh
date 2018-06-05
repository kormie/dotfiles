#!/bin/bash

cd ~/letote/letote

tmux new-session -d -s "Le Tote"

tmux rename-window -t "Le Tote":1 "Zeus Server"
tmux new-window -t "Le Tote":2 -n "Rails Server"
tmux new-window -t "Le Tote":3 -n "Node Server"
tmux new-window -t "Le Tote":4 -n "Vim"
tmux new-window -t "Le Tote":5 -n "Terminal"
tmux new-window -t "Le Tote":6 -n "Rails Console"

tmux send-keys -t "Le Tote":1 "zeus start" Enter
tmux send-keys -t "Le Tote":2 "zeus s" Enter
tmux send-keys -t "Le Tote":3 "cd webpack" Enter "npm start" Enter
tmux send-keys -t "Le Tote":4 "vi ." Enter
tmux send-keys -t "Le Tote":6 "zeus c" Enter

tmux select-window -t "Le Tote":5
tmux select-window -t "Le Tote":4
tmux attach-session -d -t "Le Tote"



