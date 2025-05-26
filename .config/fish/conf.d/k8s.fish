if set -q FISH_DEBUG
    echo (status --current-filename)
end

function kh
    echo '# basic
k    kubectl
kg   kubectl get
kd   kubectl describe
kl   kubectl logs
kp   kubectl port-forward
ke   kubectl exec
kw   kubectl get pods watch

# output
kat  output yaml
kjq  output filtered with jq

# config
kx   kubectl config (pick file, context, namespace)

kc   kubectl config (pick context)
kn   kubectl config (pick namespace)

kxf  kubectl config (pick config file)
kxc  kubectl config (create new config file)
kxd  kubectl config (disable config file)'
end

# ... basic ...

abbr -a k kubectl

abbr -a kg --function k_get
function k_get
    echo kubectl (k_scope) get (k_fzf_res deployment,statefulset,daemonset,pod,svc,configmap,secret)
end

abbr -a kd --function k_describe
function k_describe
    set -f res (k_fzf_res deployment,statefulset,daemonset,pod,svc)
    set -f scope (k_scope)
    echo "kubectl $scope describe $res | bat --style plain --color never"
end

abbr -a kl --function k_logs
function k_logs
    set -f selector (k_fzf_selector)
    echo kubectl (k_scope) logs -f -c (k_fzf_container $selector) $selector --max-log-requests 20 --since=15m --prefix=true
end

abbr -a kp --function k_portf
function k_portf
    set -f res (k_fzf_res deployment,statefulset,daemonset,pod,svc)
    set -f port (k_fzf_port $res)
    echo kubectl (k_scope) port-forward $res $port
end

abbr -a ke --function k_exec
function k_exec
    set -f pod (k_fzf_res pod)
    echo kubectl (k_scope) exec -it -c (k_fzf_container "pod/$pod") $pod --
end

abbr -a kw --function k_watch
function k_watch
    set -f selector (k_fzf_selector)
    switch "$selector"
        case "pod/*"
            echo kubectl (k_scope) get $selector -w
        case '*'
            echo kubectl (k_scope) get pods $selector -w
    end
end

# ... output ...

abbr -a kat --position anywhere --function k_bat
function k_bat
    echo "-o yaml | bat -l yaml --style plain"
end

abbr -a kjq --set-cursor=! --position anywhere --function k_jq
function k_jq
    echo "-o json | jq -r '.items[]!'"
end

# ... config ...

alias kx="kxf; kc; kn"

alias kxf="setenv KUBECONFIG (ls ~/.kube/config_* | fzf -1 --header=FILE)"
function kxc -a name
    setenv KUBECONFIG ~/.kube/config_$name
end
alias kxd="setenv KUBECONFIG /dev/null"

alias kc="kubectl config use-context (kubectl config get-contexts -o name | fzf --header=CONTEXT)"
alias kn="kubectl config set-context --current --namespace=(kubectl get ns --no-headers | fzf --header=NAMESPACE --bind 'enter:become(echo {1})')"

function k_scope
    kubectl config view --minify -o jsonpath='--context {.current-context} --namespace {..namespace}'
end

# ... fzf helpers ...

function k_fzf_res -a resources
    kubectl get $resources | fzf -1 --bind 'enter:become(echo {1})' --header="RESOURCE"
end

function k_fzf_selector
    set -f resource (k_fzf_res deployment,statefulset,daemonset,pod)
    switch $resource
        case "pod/*"
            echo $resource
        case '*'
            kubectl describe $resource | rg Selector: | awk '{print "-l " $2}'
    end
end

function k_fzf_container
    set -f ignore '(config-reloader|-exporter|linkerd-proxy|heimdal|andvare)'
    switch "$argv"
        case "pod/*"
            set -f containers (kubectl get $argv -o json | jq -r '.spec.containers[].name')
        case '*'
            set -f containers (kubectl get pods $argv -o json | jq -r '.items[].spec.containers[].name')
    end
    echo $containers | tr " " "\n" | rg -v $ignore | sort | uniq | fzf --header="CONTAINER" -1
end

function k_fzf_port -a resource
    switch "$resource"
        case "pod/*"
            set -f ports (kubectl get $resource -o json | jq -r '.spec.containers[].ports[] | "\(.name):\(.containerPort)"')
        case "service/*"
            set -f ports (kubectl get $resource -o json | jq -r '.spec.ports[] | "\(.name):\(.port)"')
        case '*'
            set -f ports (kubectl get pods (kubectl describe $resource | rg Selector: | awk '{print "-l " $2}') -o json | jq -r '.items[].spec.containers[].ports[] | "\(.name):\(.containerPort)"')
    end
    echo $ports | tr " " "\n" | sort | uniq | column -s: -t | fzf --header="PORT" -1 | awk '{print $2}'
end

# always disable kubeconfig on fish startup
kxd
