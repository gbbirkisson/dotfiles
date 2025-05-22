if set -q FISH_DEBUG
    echo (status --current-filename)
end

if status is-interactive
    if command -v starship >/dev/null
        starship init fish | source
    end
end
