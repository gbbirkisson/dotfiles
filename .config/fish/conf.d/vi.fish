if status is-interactive
    function fish_user_key_bindings
        fish_default_key_bindings -M insert
        fish_vi_key_bindings --no-erase insert

        # Accept whole suggestion with ctrl+l
        bind \cl accept-autosuggestion
        bind -M insert \cl accept-autosuggestion

        # Accept next word in suggestion with ctrl+k
        bind \ck forward-word
        bind -M insert \ck forward-word
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
