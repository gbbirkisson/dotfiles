<img align="right" width="128" height="128" src="logo.png">
<h1>dotfiles</h1>

My dotfiles and setup notes! I use ubuntu so these files are catered to that distribution.

- [Installation](#installation)
- [Makefile help](#makefile-help)
- [Terminal Cheatsheet](#terminal-cheatsheet)

## Installation

```console
$ make install-all link source
```

## Makefile help

```console
$ make
Makefile targets:
  install-all     Install everything
  update-all      Update everything
  install-be      Install build-essential
  install-rust    Install rust toolchain
  install-docker  Install docker
  apt-install     Install apt packages
  apt-update      Update apt packages
  cargo-install   Install cargo packages
  cargo-update    Update cargo packages
  vscode-install  Install vscode addons
  link            Link this repo to HOME folder
  source          Source custom dot files
  help            Show help
```

## Terminal Cheatsheet

* `CTL+F` fzf folders and cd into
* `CTL+R` fzf history
* `CTL+T` fzf current directory
