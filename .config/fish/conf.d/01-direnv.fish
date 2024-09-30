if command -v direnv >/dev/null
    if set -q TMUX; and set -q DIRENV_DIR
        for name in (set -n | grep DIRENV)
            set -e $name
        end
    end

    # Run hook
    direnv hook fish | source

    # # Add handler to play nice with fzf
    # function load_env --on-event fzf-cd-widget-done
    #     for name in (set -n | grep DIRENV)
    #         set -e $name
    #     end
    #
    #     direnv hook fish | source
    # end
    #
    # load_env
end
