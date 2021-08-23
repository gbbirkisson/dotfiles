<h1>I3 setup</h1>

My dotfiles and setup notes!

<h2>TOC</h2>

- [Install tools and dependencies](#install-tools-and-dependencies)
- [Setup preferences](#setup-preferences)
- [Bluetooth headset trouble](#bluetooth-headset-trouble)
- [Sync timezones](#sync-timezones)
- [Import wireguard profiles](#import-wireguard-profiles)
- [Install pip](#install-pip)
- [Docker MTU](#docker-mtu)

## Install tools and dependencies

```console
$ make install
```

## Setup preferences

```console
$ make setup
```

## Bluetooth headset trouble

Check out the [arch wiki](https://wiki.archlinux.org/title/Bluetooth_headset).

Maybe install `pipewire-pulse`?

## Sync timezones

```console
$ timedatectl set-ntp true
```

## Import wireguard profiles

```
$ nmcli connection import type wireguard file <FILE>
```

```
$ nmcli connection modify wg0 connection.id "some-custom-name"
```

## Install pip

```
$ python -m ensurepip --upgrade
```

## Docker MTU

```
$ sudo bash
$ cat << EOF > /etc/docker/daemon.json 
{
  "mtu": 1376
}
EOF
$ systemctl restart docker
```