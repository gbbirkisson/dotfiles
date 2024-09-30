if status is-interactive
    if command -v warp-cli >/dev/null
        warp-cli generate-completions fish | source
    end
end
