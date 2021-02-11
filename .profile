#!/bin/sh

# Profile file. Runs on login.

# Set path
export PATH=$HOME/.cargo/bin:$PATH:$HOME/.local/scripts:$HOME/.local/kubectl-plugins:$HOME/go/bin:$HOME/.linkerd2/bin:${KREW_ROOT:-$HOME/.krew}/bin
export JAVA_HOME=/usr/lib/jvm/default

# Qt and Gtk2 themes
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Set default editor for git and other programs
export VISUAL="vim"
export EDITOR="$VISUAL"
export BROWSER="firefox-developer-edition"
export TERMINAL="termite"
#export TERMINAL="urxvt"

SSH_AGENT_ENABLED=true

# Start ssh agent and set socket env variable
if [[ ! "$(pgrep -u "$USER" ssh-agent)" ]] ; then 
    ssh-agent | head -n 2 > /tmp/$USER-ssh-agent
fi

if [[ ! "$SSH_AUTH_SOCK" ]] ; then
    . /tmp/$USER-ssh-agent
fi


# Better ls colors
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# FZF options
export FZF_DEFAULT_OPTS="--height 100% --layout=reverse"
export FZF_CTRL_T_OPTS="--preview 'gfzf-preview {}'"
export FZF_ALT_C_OPTS="--preview 'gfzf-preview {}'"
export FZF_COMPLETION_OPTS="--preview 'gfzf-preview {}'"

export PATH="$HOME/.cargo/bin:$PATH"
