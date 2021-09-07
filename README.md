<img align="right" width="128" height="128" src="logo.png">
<h1>dotfiles</h1>

My dotfiles and setup notes! I use [Manjaro I3](https://manjaro.org/downloads/community/i3/) so these files are catered to that distribution.

- [Usage](#usage)
  - [Makefile help](#makefile-help)
  - [Install tools and dependencies](#install-tools-and-dependencies)
  - [Setup preferences](#setup-preferences)
- [Terminal Cheatsheet](#terminal-cheatsheet)
- [Setup tasks](#setup-tasks)
  - [Bluetooth headset trouble](#bluetooth-headset-trouble)
  - [Sync timezones](#sync-timezones)
  - [Import wireguard profiles](#import-wireguard-profiles)
  - [Install pip](#install-pip)
  - [Set Docker MTU](#set-docker-mtu)
  - [Install sonic-pi](#install-sonic-pi)
  - [Fix fonts for snaps](#fix-fonts-for-snaps)

## Usage

### Makefile help

```
$ make
Makefile targets:
  all             Install, setup and link everything
  install         Install all dependencies
  update          Update all packages
  setup           Setup and link everything
  mirrors         Set pacman mirrors
  pacman          Install pacman packages
  pacman-update   Install pacman packages
  snapd           Enable systemd snapd socket
  snap            Install snap packages
  snap-update     Update snap packages
  rustup          Setup rust
  cargo           Install cargo packages
  cargo-update    Update cargo packages
  vscode          Install vscode addons
  krew            Install krew and kubectl addons
  link            Link this repo to HOME folder
  fonts           Update font cache
  ssh-agent       Enable systemd ssh-agent service
  docker          Enable docker and setup user privileges
  help            Show help
```

### Install tools and dependencies

```console
$ make install
```

### Setup preferences

```console
$ make setup
```

## Terminal Cheatsheet

* `CTL+F` fzf folders and cd into
* `CTL+R` fzf history
* `CTL+T` fzf current directory
* `cd **<TAB>` fzf autocomplete

## Setup tasks

### Bluetooth headset trouble

Check out the [arch wiki](https://wiki.archlinux.org/title/Bluetooth_headset).

Maybe install `pipewire-pulse`?

### Sync timezones

```console
$ timedatectl set-ntp true
```

### Import wireguard profiles

```console
$ nmcli connection import type wireguard file <FILE>
```

```console
$ nmcli connection modify wg0 connection.id "some-custom-name"
```

### Install pip

```console
$ python -m ensurepip --upgrade
```

### Set Docker MTU

```console
$ sudo bash
$ cat << EOF > /etc/docker/daemon.json 
{
  "mtu": 1376
}
EOF
$ systemctl restart docker
```

### Install sonic-pi

If using pipewire:

``` console
$ sudo pacman -S sonic-pi pipewire-jack
$ pw-jack sonic-pi
```

Some stuff that might have made a difference?

``` console
$ sudo pacman -S sonic-pi libffado
$ sudo ldconfig
$ sudo groupadd realtime
$ sudo usermod -a -G realtime $USER
$ sudo pacman -S pipewire-jack 
```

### Fix fonts for snaps

For example the slack fonts were not working:

```console
$ rm -r ~/snap/slack/common/.cache/fontconfig
$ touch ~/snap/slack/common/.cache/fontconfig
```