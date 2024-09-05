if command -v fzf >/dev/null
    # Send event to play nice with direnv
    fzf --fish | sed '117i emit fzf-cd-widget-done' | source

    # Bind ctrl+f
    bind \cf fzf-cd-widget
    bind -M insert \cf fzf-cd-widget
end

if command -v direnv >/dev/null
    direnv hook fish | source

    # Add handler to play nice with fzf
    function handler --on-event fzf-cd-widget-done
        direnv export fish | source
        if direnv status | grep -q 'Found RC path'
            echo
        end
    end
end

if command -v mise >/dev/null
    mise activate fish | source
    mise completions fish | tail -n +9 | source

    if mise which kubectl >/dev/null
        eval (mise which kubectl) completion fish | source
    end

    setenv MISE_NOT_FOUND_AUTO_INSTALL false
    setenv MISE_DISABLE_TOOLS direnv
    setenv MISE_PYTHON_COMPILE 1
    setenv MISE_EXPERIMENTAL 1
    # setenv MISE_DEBUG 1
end

if command -v starship >/dev/null
    starship init fish | source
end

if status is-interactive
    function fish_user_key_bindings
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert
    end
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    set fish_cursor_external line
    set fish_cursor_visual block

    function fish_greeting
        # No greeting
    end
end
