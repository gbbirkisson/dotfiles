if set -q FISH_DEBUG
    echo (status --current-filename)
end

setenv AMEDIA_REPOS $HOME/repos/amedia
setenv K8S_OBJECTS_DIR $AMEDIA_REPOS/k8s-objects

alias gopass="PASSWORD_STORE_DIR=$HOME/repos/amedia/apass $HOME/.local/bin/gopass"

setenv SITECONFIG_PATH $HOME/repos/amedia/site-config
alias sitetool="$HOME/repos/amedia/sitetool/bin/sitetool"

abbr -a a a2l

function deploy
    if test (count $argv) -ne 3
        echo "Usage: amedia-deploy <app> <env> <version>"
        return 1
    end
    set app $argv[1]
    set env $argv[2]
    set ver $argv[3]
    xdg-open "https://secure.amedia.cloud/api/idp-github-app/deploy/amedia/$app/$env/$app/$ver"
end
