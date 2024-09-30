if command -v direnv >/dev/null
    if set -q TMUX; and set -q DIRENV_DIR
        for name in (set -n | grep DIRENV)
            set -e $name
        end
    end

    # Run hook
    direnv hook fish | source
end
