# My dotfiles

These dotfiles are for Manjaro I3 edition

## Setup dotfiles

```bash
make dotfiles
```

## Git hooks

```bash
git config --global init.templatedir '~/.git_template'
```

## Extra dependencies

For the status bar you need to install:

```bash
pacman -S sysstat i3blocks
```

## Installing numlockx

```bash
pacman -S numlockx
```

## Installing teams

```bash
export TEAMS_VERSION=0.0.7
wget https://github.com/ivelkov/teams-for-linux/releases/download/v0.0.7/teams-for-linux-${TEAMS_VERSION}.pacman
sudo pacman -U teams-for-linux-${TEAMS_VERSION}.pacman
```

## Installing pigdin

```bash
sudo pacman -S pidgin pidgin-sipe
```

And configure it like so: https://blog.programster.org/ubuntu-16-04-configure-pidgin-for-skype-for-business-lync

## Installing rambox

```bash
yaourt -S ttf-ms-fonts
fc-cache -vfr
yaourt -S rambox-bin
```

## Installing Spotify

```bash
pacman -S snapd
systemctl start snapd.service
snap install spotify

# Maybe you need pulseaudio
pacman -S pulseaudio pulseaudio-alsa
reboot
```

## JDK

```bash
pacman -S jdk8-openjdk
pacman -S maven
yaourt -S intellij-idea-community-edition
```

## Gcloud

```bash
yaourt -S kubectl-bin
yaourt -S google-cloud-sdk
yaourt -S kubernetes-helm (edit version and checksum)
```