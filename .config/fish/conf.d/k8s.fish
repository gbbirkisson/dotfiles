function kh
    echo '# basic
k    kubectl
kg   kubectl get
kd   kubectl describe
kp   kubectl port-forward
kl   kubectl logs
ke   kubectl exec

# pickers
klp  fzf pods
kld  fzf deployment
klm  fzf daemonset
kls  fzf service
klc  fzf configmap

# output
kat  output yaml
kjq  output json
kon  output only names

# config
kxe  enable e config
kxm  enable m config
kxd  disable config
'
end

abbr -a k kubectl
abbr -a kg kubectl get
abbr -a kc kubectl ctx
abbr -a kn kubectl ns
abbr -a kd --set-cursor=! "kubectl describe ! | bat --style plain --color never"

function k_portf
    echo kubectl port-forward (k_fzf_pod)
end
abbr -a kp --function k_portf

function k_logs
    echo kubectl logs -f --all-containers=true (k_fzf_pod)
end
abbr -a kl --function k_logs

function k_exec
    echo kubectl exec (k_fzf_pod) --
end
abbr -a ke --function k_exec

function k_fzf
    kubectl get $argv[1] | fzf --header-lines=1 --bind "enter:become(echo $argv[1]/{1})" --header="Pick your $argv[1]!"
end

function k_fzf_pod
    k_fzf pod
end
abbr -a klp --position anywhere --function k_fzf_pod

function k_fzf_deployment
    k_fzf deployment
end
abbr -a kld --position anywhere --function k_fzf_deployment

function k_fzf_daemon
    k_fzf daemonset
end
abbr -a klm --position anywhere --function k_fzf_daemon

function k_fzf_service
    k_fzf service
end
abbr -a kls --position anywhere --function k_fzf_service

function k_fzf_config
    k_fzf configmap
end
abbr -a klc --position anywhere --function k_fzf_config

function k_bat
    echo "-o yaml | bat -l yaml --style plain"
end
abbr -a kat --position anywhere --function k_bat

function k_jq
    echo "-o json | jq '.!'"
end
abbr -a kjq --position anywhere --function k_jq --set-cursor=!

function k_name
    echo "-o name --no-headers=true"
end
abbr -a kon --position anywhere --function k_name

# config management
alias kxd="setenv KUBECONFIG /dev/null"
for f in e m
    alias "kx$f"="setenv KUBECONFIG ~/.kube/config_$f"
end
kxd

# k9s
alias ks='KUBECONFIG=~/.kube/config_e k9s -n default -c ns'
