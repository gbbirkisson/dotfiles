if set -q FISH_DEBUG
    echo (status --current-filename)
end

function pick --description "pick path from stdin: cd into dirs, open files in nvim, print if piped"
    set -l entries
    awk '!seen[$0]++' | while read -l entry
        test -e (string split -f1 : -- $entry); and set -a entries $entry
    end
    test (count $entries) -gt 0; or return 1

    set -l pick (printf '%s\n' $entries | fzf --delimiter : --preview 'fzf-script-preview {1}')
    or return

    set -l parts (string split -m1 : -- $pick)
    set -l line
    if set -q parts[2]
        set line (string match -r '^\d+(?=:|$)' -- $parts[2])
        or set line (grep -nF -m1 -- $parts[2] $parts[1] | string split -f1 :)
    end

    if not isatty stdout
        echo $parts[1]
    else if test -d $parts[1]
        cd $parts[1]
    else if test -n "$line"
        nvim +$line $parts[1] </dev/tty
    else
        nvim $parts[1] </dev/tty
    end
end
