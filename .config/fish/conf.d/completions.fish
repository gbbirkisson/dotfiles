if set -q FISH_DEBUG
    echo (status --current-filename)
end

function gen_completions --description "generate completions"
    set DIR $HOME/.config/fish/completions

    bash -c "rm $DIR/*"
    if command -v a2l >/dev/null
        a2l completion fish >$DIR/a2l.fish
    end

    if command -v direnv >/dev/null
        direnv hook fish >$DIR/direnv.fish
    end

    if command -v warp-cli >/dev/null
        warp-cli generate-completions fish >$DIR/warp.fish
    end

    if command -v xh >/dev/null
        xh --generate complete-fish >$DIR/xh.fish
    end

    if command -v mise >/dev/null
        mise completions fish >$DIR/mise.fish

        if mise which kubectl >/dev/null
            eval (mise which kubectl) completion fish >$DIR/kubectl.fish
        end

        if mise which just >/dev/null
            eval (mise which just) --completions fish >$DIR/just.fish
        end

        if mise which hk >/dev/null
            eval (mise which hk) completion fish >$DIR/hk.fish
        end
    end
end
