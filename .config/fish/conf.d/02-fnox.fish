if set -q FISH_DEBUG
    echo (status --current-filename)
end

if command -v fnox >/dev/null
    fnox activate fish | source
    fnox completion fish | source
end
