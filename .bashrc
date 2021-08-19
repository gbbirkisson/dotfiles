# ~/.bashrc | per-interactive-shell startup

# If this is not an interactive shell, do not do anything
[[ $- != *i* ]] && return

# Add bash-completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	# Use starship if available
	if command -v starship &> /dev/null ; then
		eval "$(starship init bash)"
	else
		if [[ ${EUID} == 0 ]] ; then
			PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
		else
			PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
		fi
	fi

	if command -v exa &> /dev/null ; then
		alias ls='exa'
		alias l="exa -lF -s type"   # List all files colorized in long format
		alias la="exa -alF -s type" # List all files colorized in long format, including dot files
		alias ll="exa -alF -s type"
	else
		alias ls='ls --color=auto'
	fi

	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi
unset use_color safe_term match_lhs sh

# Permits the root user on the local machine to connect to X windows display
xhost +local:root > /dev/null 2>&1

# Tab completion with sudo
complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Expand aliases
#shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Infinite history.
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth:erasedups

# Add kubectl completion
source <(kubectl completion bash)

# Fzf key bindings and completion
source /usr/share/fzf/key-bindings.bash
bind "$(bind -s | grep '^"\\ec"' | sed 's/\\ec/\\C-f/')" # Rebind ATL-C to CTRL-F
source /usr/share/fzf/completion.bash

# Source bash_prompt and aliases
for file in ~/.{aliases_personal}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file