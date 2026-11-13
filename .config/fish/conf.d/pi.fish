if set -q FISH_DEBUG
    echo (status --current-filename)
end

set -gx LLAMA_BASE_URL https://llm.gbb.is
