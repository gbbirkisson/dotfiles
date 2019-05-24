#!/bin/bash

# If you’ve already logged into your machine and open a new terminal window (xterm)
# then .bashrc is executed before the  window command prompt. .bashrc is also run
# when you start a new bash instance by typing /bin/bash in a terminal.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Tab completion with sudo
complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend
HISTSIZE= HISTFILESIZE= # Infinite history.

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

# Source bash_prompt and aliases
for file in ~/.{bash_prompt,aliases}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Add bash-completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Add kubectl completion
source <(kubectl completion bash)

# Fzf key bindings and completion
source /usr/share/fzf/key-bindings.bash
bind "$(bind -s | grep '^"\\ec"' | sed 's/\\ec/\\C-f/')" # Rebind ATL-C to CTRL-F
source /usr/share/fzf/completion.bash