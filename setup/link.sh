#!/bin/sh

set -e

lf() {
    T=${HOME}/$(realpath --relative-to=$PWD $1)
    mkdir -p "$(dirname $T)"
    echo "Link $1 -> $T"
    rm -rf $T
    ln -sf $1 $T
}

link() {
    for file in $@
    do
        lf $file
    done
}

link $(find $PWD/.config -maxdepth 1 -not -name ".config" -not -name "Code")
link $(find $PWD/.config/Code/User -maxdepth 1 -not -name "User")
link $(find $PWD/.local -maxdepth 1 -not -name ".local")
link $(find $PWD/.ssh -maxdepth 1 -not -name ".ssh")

link $(find $PWD -maxdepth 1 -name ".*"	\
    -not -name ".gitignore" \
    -not -name ".git" \
    -not -name ".*.swp" \
    -not -name ".ssh" \
    -not -name ".config" \
    -not -name ".local" \
)

rm -rf ${HOME}/.i3
rm -rf "${HOME}/.config/Code - OSS"
ln -sf ${HOME}/.config/Code "${HOME}/.config/Code - OSS"