#! /usr/bin/bash

SESSION="daily"

tmux has-session -t $SESSION 2>/dev/null
if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION -n home
    tmux send-keys -t $SESSION "cd ~ && clear" C-m

    tmux new-window -t $SESSION -n work
    tmux send-keys -t $SESSION "cd ~/Projects/DataAnnotation/ && clear" C-m

    tmux new-window -t $SESSION -n nvim
    tmux send-keys -t $SESSION "cd ~/Projects/DataAnnotation/ && clear && v" C-m
fi

tmux attach -t $SESSION
