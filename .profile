# ~/.profile | Runs on login

# Manjaro i3 stuff
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Default apps
export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/firefox"
export TERMINAL="termite"

# FZF options
export FZF_DEFAULT_OPTS="--height 100% --layout=reverse"
export FZF_CTRL_T_OPTS="--preview 'gfzfpreview {}'"
export FZF_ALT_C_OPTS="--preview 'gfzfpreview {}'"
export FZF_COMPLETION_OPTS="--preview 'gfzfpreview {}'"

# SSH agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Different paths
export GOPATH="$HOME/.go"
export PATH="$PATH:$HOME/.local/scripts:$HOME/.go/bin:$HOME/.cargo/bin:$HOME:$HOME/.krew/bin"
export JAVA_HOME="/usr/lib/jvm/default"