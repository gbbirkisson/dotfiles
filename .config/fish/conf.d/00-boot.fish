# setenv FISH_DEBUG true

if set -q FISH_DEBUG
    echo (status --current-filename)
end
