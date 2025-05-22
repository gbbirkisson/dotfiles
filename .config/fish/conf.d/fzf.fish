if set -q FISH_DEBUG
    echo (status --current-filename)
end

if status is-interactive
    if command -v fzf >/dev/null
        # Send event to play nice with direnv
        fzf --fish | sed '117i echo' | source

        # Bind ctrl+f
        bind \cf fzf-cd-widget
        bind -M insert \cf fzf-cd-widget
    end
end
