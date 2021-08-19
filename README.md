<h1>I3 setup</h1>

My dotfiles and setup notes!

<h3>TOC</h3>

- [Install tools and dependencies](#install-tools-and-dependencies)
- [Setup preferences](#setup-preferences)
- [Bluetooth headset trouble](#bluetooth-headset-trouble)
- [Sync timezones](#sync-timezones)

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
