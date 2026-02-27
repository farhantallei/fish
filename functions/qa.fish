function qa
    if set -q TMUX
        tmux kill-server
    end
    exit
end
