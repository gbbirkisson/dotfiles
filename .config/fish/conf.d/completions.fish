if status is-interactive
    if command -v direnv >/dev/null
        direnv hook fish | source
    end

    if command -v warp-cli >/dev/null
        warp-cli generate-completions fish | source
    end

    if command -v xh >/dev/null
        xh --generate complete-fish | source
    end
end
