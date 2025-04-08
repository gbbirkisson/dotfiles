# xh
for method in get post put delete
    abbr -a $method xh $method
end

# docker
function dstp --description "stop all containers"
    docker stop (docker ps -q)
end
function drma --description "remove all docker containers"
    docker rm (docker ps -aq --filter status=exited --filter status=created)
end
function drmi --description "remove all untagged images"
    docker rmi -f (docker images -f "dangling=true" -q)
end
function drmv --description "remove all untagged images"
    docker volume rm (docker volume ls -f dangling=true -q)
end
function dcln --description "clean all the docker things"
    dstp
    drma
    drmi
    drmv
end

# bat
if command -v bat >/dev/null
    alias cat='bat -pp'
    alias yat='bat -l yaml'
end

# lsd
if command -v lsd >/dev/null
    alias ls="lsd -1 --group-directories-first" # list files
    alias l="lsd -1 --group-directories-first" # list files
    alias ll="lsd -Al --group-directories-first" # list all files colorized in long format
    alias lt="lsd --tree" # list tree
end

# sfz
abbr -a serve 'sfz -b 0.0.0.0 -p 8000'

# poetry
abbr -a p poetry
abbr -a prefresh 'rm -r .venv && poetry install'
abbr -a pfix 'poetry cache clear --all . && rm -rf (poetry config cache-dir)/artifacts'
abbr -a penv 'poetry env use (mise which python)'

# direnv
abbr -a da "direnv allow"
abbr -a dr "direnv reload"
abbr -a dx "direnv deny"
abbr -a di "rm -r .venv && direnv reload"

# nvim
abbr -a n nvim
alias day='cd $HOME/repos/personal/notes && nvim -c :ObsidianToday'
alias notes='cd $HOME/repos/personal/notes && nvim -c :ObsidianCheck'
alias todo='cd $HOME/repos/personal/notes && nvim -c :ObsidianCheck todo.md'

# ai
alias llmchad="nvim -c ':CL' -c ':CodeCompanionChat openai' -c ':on'"
alias llmclaude="nvim -c ':CL' -c ':CodeCompanionChat anthropic' -c ':on'"
alias llmdeepseek="nvim -c ':CL' -c ':CodeCompanionChat deepseek' -c ':on'"
alias llmollama="nvim -c ':CL' -c ':CodeCompanionChat ollama' -c ':on'"

function dalle
    curl https://api.openai.com/v1/images/generations \
        -H "Authorization: Bearer $(op read op://hemwnx22rvxga5v2zkicawq6sq/l6mbqk77zt62hrdxahozqi6uom/key --no-newline)" \
        -H "Content-Type: application/json" \
        -d '{
        "prompt": "'"$argv"'",
        "num_images":1,
        "model":"dall-e-3",
        "quality":"standard",
        "size":"1024x1024",
        "response_format":"url"
    }' | tee /dev/stderr | jq .data[0].url | xargs open
end

# git
abbr -a g git
abbr -a gd gh dash
abbr -a gg lazygit

# Jump to git root or home
function d
    while not contains $PWD / "$HOME"
        if test -d .git
            break
        end
        cd ..
    end
end

# tools
abbr -a m make
abbr -a c cargo
abbr -a o xdg-open
abbr -a j just

# other
alias whispy='OPENAI_API_KEY=$(op read op://hemwnx22rvxga5v2zkicawq6sq/l6mbqk77zt62hrdxahozqi6uom/key --no-newline) $HOME/repos/personal/whispy/.venv/bin/whispy'
alias pa='cd $HOME/repos/personal/pa && just pa'
alias gt="$HOME/repos/personal/gt/.venv/bin/python -m gt"
alias cal="$DOTFILES/.venv/calcure/bin/calcure"
alias wtf='xrandr --output $(xrandr |grep eDP|cut -d" " -f1) --rotate normal'
alias icat="timg -p kitty"

# translate functions
function trs -a source -a target -d "Translate something"
    xh 'https://lingva.ml/api/v1/'$source'/'$target'/'"$argv[3..-1]" | jq -r .translation
end

alias no="trs no en"
alias en="trs en no"

function noc -d "Check norwegian"
    trs en no (trs no en $argv)
end

# easy grafana stack
abbr -a lgtm 'docker run --add-host host.docker.internal:host-gateway --pull always -p 3000:3000 -p 4317:4317 -p 4318:4318 --rm --name lgtm -ti grafana/otel-lgtm'
