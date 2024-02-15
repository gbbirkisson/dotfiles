#!/bin/bash

export FZF_DEFAULT_OPTS="--height 100% --layout=reverse"
export FZF_CTRL_T_OPTS="--preview 'gfzfpreview {}'"
export FZF_ALT_C_OPTS="--preview 'gfzfpreview {}'"
export FZF_ALT_C_COMMAND="command find -L . \
    -mindepth 1 \\( -path '*target/wasm32*' -o -path '*target/x86_64*' -o -path '*target/debug/*' -o -path '*target/release/*' -o -path '*/node_modules*' -o -path './snap*' -o -path './go*' -o -path '*/__pycache__' -o -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"
export FZF_COMPLETION_OPTS="--preview 'gfzfpreview {}'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS""\
 --color=bg+:#{{base01_hex}},bg:#{{base00_hex}},spinner:#{{base0C_hex}},hl:#{{base0D_hex}}""\
 --color=fg:#{{base04_hex}},header:#{{base0D_hex}},info:#{{base0A_hex}},pointer:#{{base0C_hex}}""\
 --color=marker:#{{base0C_hex}},fg+:#{{base06_hex}},prompt:#{{base0A_hex}},hl+:#{{base0D_hex}}"
