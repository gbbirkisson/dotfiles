# ~/.bashrc
#
# If you’ve already logged into your machine and open a new terminal window (xterm)
# then .bashrc is executed before the  window command prompt. .bashrc is also run
# when you start a new bash instance by typing /bin/bash in a terminal.

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# To provide access to an application running as sudo or su to the graphical server
xhost +local:root > /dev/null 2>&1

# Tab completion with sudo
complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

#shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done


for file in ~/.{bash_env,bash_prompt,aliases}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Add local bin to path
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin

# Add local libs
#LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Add bash-completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Add kubectl completion
source <(kubectl completion bash)

# Add fzf stuff + history
HISTSIZE=10000
HISTFILESIZE=10000
source /usr/share/fzf/key-bindings.bash
FZF_DEFAULT_OPTS="--layout=reverse --border"
FZF_CTRL_T_OPTS="--preview 'gbb-fzf-preview {}'"
#source /usr/share/fzf/completion.bash

# Add node version manager
#source /usr/share/nvm/init-nvm.sh

# Add tab completion for SSH hostnames based on ~/.ssh/config
# ignoring wildcards
# [[ -e "$HOME/.ssh/config" ]] && complete -o "default" \
# 	-o "nospace" \
# 	-W "$(grep "^Host" ~/.ssh/config | \
# 	grep -v "[?*]" | cut -d " " -f2 | \
# 	tr ' ' '\n')" scp sftp ssh

# Makefile Completion
# complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make


# Set aah-agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
