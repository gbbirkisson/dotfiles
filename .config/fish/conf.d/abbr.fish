# httpie
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

# kubectl
abbr -a k kubectl
alias kd="setenv KUBECONFIG /dev/null"
for f in e m
    alias "k$f"="setenv KUBECONFIG ~/.kube/config_$f"
end
kd

# k9s
alias ks='KUBECONFIG=~/.kube/config_e k9s --context default -n default -c ns'

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

# nvim
abbr -a v nvim
abbr -a vim nvim
alias day='cd $HOME/repos/personal/notes && nvim -c :ObsidianToday'
alias notes='cd $HOME/repos/personal/notes && nvim -c :ObsidianCheck .'
alias llmchad="nvim -c ':CodeCompanionChat openai'"
alias llmollama="nvim -c ':CodeCompanionChat ollama'"

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

# other
alias gt="$HOME/repos/personal/gt/.venv/bin/python -m gt"
alias cal="$DOTFILES/.venv/calcure/bin/calcure"
alias wtf='xrandr --output $(xrandr |grep eDP|cut -d" " -f1) --rotate normal'
alias dev_tunnel='cloudflared --no-autoupdate tunnel run --token $(op read op://hemwnx22rvxga5v2zkicawq6sq/oy5g4ntwcf4lfom5lzzrzfl5ua/credential --no-newline)'

# us layout cheatsheet
function en
    echo '` 1 2 3 4 5 6 7 8 9 0 - =
~ ! @ # $ % ^ & * ( ) _ +

 q w e r t y u i o p [ ]
 Q W E R T Y U I O P { }

  a s d f g h j k l ; \' \\
  A S D F G H J K L : " |

 < z x c v b n m , . /
 > Z X C V B N M < > ?'
end