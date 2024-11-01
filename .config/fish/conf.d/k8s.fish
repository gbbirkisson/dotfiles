abbr -a k kubectl
abbr -a kg kubectl get
abbr -a kd --set-cursor=! "kubectl describe ! | bat --style plain --color never"
abbr -a kp kubectl port-forward

function k_bat
    echo "-o yaml | bat -l yaml --style plain"
end
abbr -a kat --position anywhere --function k_bat

function k_name
    echo "-o name --no-headers=true"
end
abbr -a kon --position anywhere --function k_name

function k_fzf_pod
    kubectl get pods -o name --no-headers=true | fzf
end
abbr -a kzp --position anywhere --function k_fzf_pod

function k_fzf_deployment
    kubectl get deployment -o name --no-headers=true | fzf
end
abbr -a kzd --position anywhere --function k_fzf_deployment

# Config management
alias kxd="setenv KUBECONFIG /dev/null"
for f in e m
    alias "kx$f"="setenv KUBECONFIG ~/.kube/config_$f"
end
kxd

# k9s
alias ks='KUBECONFIG=~/.kube/config_e k9s -n default -c ns'
