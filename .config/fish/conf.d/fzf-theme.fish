if set -q FISH_DEBUG
    echo (status --current-filename)
end

if status is-interactive
    setenv FZF_DEFAULT_OPTS "--height 100% --layout=reverse"
    setenv FZF_CTRL_T_OPTS "--preview 'gfzfpreview {}'"
    setenv FZF_ALT_C_OPTS "--preview 'gfzfpreview {}'"
    setenv FZF_ALT_C_COMMAND "command find -L . \
        -mindepth 1 \\( -path '*target/wasm32*' -o -path '*target/x86_64*' -o -path '*Android/*' -o -path '*target/debug/*' -o -path '*target/release/*' -o -path '*/node_modules*' -o -path './snap*' -o -path './go*' -o -path '*/__pycache__' -o -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type d -print 2> /dev/null | cut -b3-"
    setenv FZF_COMPLETION_OPTS "--preview 'gfzfpreview {}'"
    setenv FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS""\
     --color=bg+:#353b45,bg:#1e222a,spinner:#56b6c2,hl:#61afef""\
     --color=fg:#565c64,header:#61afef,info:#e5c07b,pointer:#56b6c2""\
     --color=marker:#56b6c2,fg+:#b6bdca,prompt:#e5c07b,hl+:#61afef"
end
