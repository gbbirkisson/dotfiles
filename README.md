<img align="right" src="logo.png">
<h1>dotfiles</h1>

My dotfiles and setup notes! I use [Manjaro I3](https://manjaro.org/download/#i3) so these files are catered to that distribution.

- [Usage](#usage)
  - [Install tools and dependencies](#install-tools-and-dependencies)
  - [Setup preferences](#setup-preferences)
- [Terminal Cheatsheet](#terminal-cheatsheet)
- [Setup tasks](#setup-tasks)
  - [Bluetooth headset trouble](#bluetooth-headset-trouble)
  - [Sync timezones](#sync-timezones)
  - [Import wireguard profiles](#import-wireguard-profiles)
  - [Install pip](#install-pip)
  - [Set Docker MTU](#set-docker-mtu)

## Usage

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

```
$ nmcli connection import type wireguard file <FILE>
```

```
$ nmcli connection modify wg0 connection.id "some-custom-name"
```

### Install pip

```
$ python -m ensurepip --upgrade
```

### Set Docker MTU

```
$ sudo bash
$ cat << EOF > /etc/docker/daemon.json 
{
  "mtu": 1376
}
EOF
$ systemctl restart docker
```