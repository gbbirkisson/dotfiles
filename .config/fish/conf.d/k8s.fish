if set -q FISH_DEBUG
    echo (status --current-filename)
end

function kh
    echo '# basic
k    kubectl
kg   kubectl get
kga  kubectl get all
kd   kubectl describe
kl   kubectl logs
kp   kubectl port-forward
ke   kubectl exec
kcp  kubectl cp (pick pod)
kw   kubectl get pods watch

# debugging
kev   kubectl events
klp   kubectl logs (previous)
kdiag kubectl diagnose (workload + pods)
kdbg  kubectl debug (ephemeral container)

# output
kat  output yaml
kjq  output filtered with jq

# config
kx   kubectl config (pick file, context, namespace)

kf   kubectl config (pick config file)
kc   kubectl config (pick context)
kn   kubectl config (pick namespace)

kxd  kubectl config (disable config file)
kxc  kubectl config (create new config file)

# other
ki   init kubectl at the start of the day'
end

# ... basic ...

abbr -a k --function k_kubectl
function k_kubectl
    set -f scope (k_scope); or return 1
    echo kubectl $scope
end

abbr -a kg --function k_get
function k_get
    set -f scope (k_scope); or return 1
    set -f res (k_fzf_res deployment,statefulset,daemonset,pod,svc,configmap,secret)
    test -n "$res"; or return 1
    echo kubectl $scope get $res
end

abbr -a kga --function k_get_all
function k_get_all
    set -f scope (k_scope); or return 1
    echo kubectl $scope get all
end

abbr -a kd --function k_describe
function k_describe
    set -f scope (k_scope); or return 1
    set -f res (k_fzf_res deployment,statefulset,daemonset,pod,svc)
    test -n "$res"; or return 1
    echo "kubectl $scope describe $res | nvim -c 'set ft=yaml buftype=nofile' -"
end

abbr -a kl --function k_logs
function k_logs
    set -f scope (k_scope); or return 1
    set -f selector (k_fzf_selector)
    test -n "$selector"; or return 1
    set -f container (k_fzf_container $selector)
    test -n "$container"; or return 1
    echo kubectl $scope logs -f -c $container $selector --max-log-requests 20 --since=15m --tail=1000 --prefix=true
end

abbr -a kp --function k_portf
function k_portf
    set -f scope (k_scope); or return 1
    set -f res (k_fzf_res deployment,statefulset,daemonset,pod,svc)
    test -n "$res"; or return 1
    set -f port (k_fzf_port $res)
    test -n "$port"; or return 1
    echo kubectl $scope port-forward $res $port
end

abbr -a ke --function k_exec
function k_exec
    set -f scope (k_scope); or return 1
    set -f pod (k_fzf_res pod)
    test -n "$pod"; or return 1
    set -f container (k_fzf_container "pod/$pod")
    test -n "$container"; or return 1
    echo kubectl $scope exec -it -c $container $pod --
end

abbr -a kcp --set-cursor=! --function k_cp
function k_cp
    set -f scope (k_scope); or return 1
    set -f pod (k_fzf_res pod)
    test -n "$pod"; or return 1
    echo "kubectl $scope cp $pod:! ."
end

abbr -a kw --function k_watch
function k_watch
    set -f scope (k_scope); or return 1
    set -f selector (k_fzf_selector)
    test -n "$selector"; or return 1
    switch "$selector"
        case "pod/*"
            echo kubectl $scope get $selector -w
        case '*'
            echo kubectl $scope get pods $selector -w
    end
end

# ... debugging ...

abbr -a kev --function k_events
function k_events
    set -f scope (k_scope); or return 1
    set -f res (k_fzf_res deployment,statefulset,daemonset,pod,svc)
    test -n "$res"; or return 1
    set -f name (string split / $res)[-1]
    echo "kubectl $scope get events --sort-by=.metadata.creationTimestamp | grep --color=never -E '(^LAST SEEN|/$name)'"
end

abbr -a klp --function k_logs_previous
function k_logs_previous
    set -f scope (k_scope); or return 1
    set -f selector (k_fzf_selector)
    test -n "$selector"; or return 1
    set -f container (k_fzf_container $selector)
    test -n "$container"; or return 1
    echo kubectl $scope logs -p -c $container $selector --max-log-requests 20 --tail=1000 --prefix=true
end

function kdiag
    set -f scope (k_scope); or return 1
    set -f res (k_fzf_res deployment,statefulset,daemonset)
    test -n "$res"; or return 1
    set -f selector (kubectl describe $res | rg Selector: | awk '{print "-l " $2}')
    test -n "$selector"; or return 1
    set -f name (string split / $res)[-1]

    set -l cmd_pods "kubectl $scope \\
    get pods $selector \\
    -o wide"
    set -l cmd_restarts "kubectl $scope \\
    get pods $selector \\
    -o custom-columns='NAME:.metadata.name,RESTARTS:.status.containerStatuses[*].restartCount,REASON:.status.containerStatuses[*].lastState.terminated.reason,EXIT:.status.containerStatuses[*].lastState.terminated.exitCode'"
    set -l cmd_events "kubectl $scope \\
    get events \\
    --sort-by=.metadata.creationTimestamp \\
    --field-selector type=Warning \\
    | grep --color=never -E '(^LAST SEEN|/$name)'"

    echo "=== PODS ==="
    echo "\$ $cmd_pods"
    eval $cmd_pods
    echo
    echo "=== CONTAINER LAST STATE ==="
    echo "\$ $cmd_restarts"
    eval $cmd_restarts
    echo
    echo "=== WARNING EVENTS ==="
    echo "\$ $cmd_events"
    eval $cmd_events
end

abbr -a kdbg --function k_debug
function k_debug
    set -f scope (k_scope); or return 1
    set -f pod (k_fzf_res pod)
    test -n "$pod"; or return 1
    echo kubectl $scope debug -it --image=alpine $pod --
end

# ... output ...

abbr -a kat --position anywhere --function k_nvim
function k_nvim
    echo "-o yaml | nvim -c 'set ft=yaml buftype=nofile' -"
end

abbr -a kjq --set-cursor=! --position anywhere --function k_jq
function k_jq
    echo "-o json | jq -r '.!'"
end

# ... config ...

function kx
    kf; and kc; and kn
    or kxd
end

function kf
    set -l file (ls ~/.kube/config_* | fzf -1 --header=FILE)
    test -n "$file"; or return 1
    set -gx KUBECONFIG $file
end

function kxc -a name
    set -gx KUBECONFIG ~/.kube/config_$name
end

alias kxd="set -gx KUBECONFIG /dev/null"

function kc
    set -l ctx (kubectl config get-contexts -o name | fzf --header=CONTEXT)
    test -n "$ctx"; or return 1
    kubectl config use-context $ctx
end

function kn
    set -l ns (kubectl get ns --no-headers | fzf --header=NAMESPACE --bind 'enter:become(echo {1})')
    test -n "$ns"; or return 1
    kubectl config set-context --current --namespace=$ns
end

function k_scope
    if not test -f "$KUBECONFIG"
        echo "k_scope: KUBECONFIG is not a valid file ($KUBECONFIG)" >&2
        return 1
    end
    kubectl config view --minify -o jsonpath='--context {.current-context} --namespace {..namespace}'
end

# ... config ...

function ki
    kf; and a2l auth
end

# ... fzf helpers ...

function k_fzf_res -a resources
    set -l preview "kubectl describe {1}"
    if not string match -q "*,*" $resources
        set preview "kubectl describe $resources {1}"
    end
    kubectl get $resources | fzf -1 --header-lines=1 --header=RESOURCE \
        --preview $preview \
        --preview-window=right:50% | awk '{print $1}'
end

function k_fzf_selector
    set -f resource (k_fzf_res deployment,statefulset,daemonset,pod)
    test -n "$resource"; or return 1
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
