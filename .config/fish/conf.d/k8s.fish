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

# output
kat  output yaml

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
function k_get -a selector -a container
    echo kubectl get (k_fzf_res deployment,statefulset,daemonset,pod,svc,configmap,secret)
end

abbr -a kd --function k_describe
function k_describe -a selector -a container
    echo "kubectl describe (k_fzf_res deployment,statefulset,daemonset,pod,svc,configmap,secret) | bat --style plain --color never"
end

abbr -a kl --function k_logs
function k_logs -a selector -a container
    set selector (k_fzf_selector)
    echo kubectl logs -f -c (k_fzf_container $selector) $selector --max-log-requests 20 --since=15m --prefix=true
end

abbr -a kp --function k_portf
function k_portf
    echo kubectl port-forward (k_fzf_res deployment,statefulset,daemonset,pod,svc)
end

abbr -a ke --function k_exec
function k_exec
    set p (k_fzf_res pod)
    echo kubectl exec -it -c (k_fzf_container "pod/$p") $p --
end

# ... output ...

abbr -a kat --position anywhere --function k_bat
function k_bat
    echo "-o yaml | bat -l yaml --style plain"
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

# ... fzf helpers ...

function k_fzf_res -a include
    kubectl get $include | fzf -1 --bind 'enter:become(echo {1})'
end

function k_fzf_selector
    set pick (k_fzf_res deployment,statefulset,daemonset,pod)
    switch $pick
        case "pod/*"
            echo $pick
        case '*'
            kubectl describe $pick | rg Selector: | awk '{print "-l " $2}'
    end
end

function k_fzf_container
    set ignore '(config-reloader|-exporter|linkerd-proxy)'
    switch "$argv"
        case "pod/*"
            set containers (kubectl get $argv -o json | jq -r '.spec.containers[].name')
        case '*'
            set containers (kubectl get pods $argv -o json | jq -r '.items[].spec.containers[].name')
    end
    echo $containers | tr " " "\n" | rg -v $ignore | sort | uniq | fzf --header="Pick your container!" -1
end

# always disable kubeconfig on fish startup
kxd
