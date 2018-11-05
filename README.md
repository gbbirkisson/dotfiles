# My dotfiles

These dotfiles are for Manjaro I3 edition

## Setup dotfiles

```bash
make
```

## Git hooks

```bash
git config --global init.templatedir '~/.git_template'
```

## Gcloud

```bash
yaourt -S kubectl-bin
yaourt -S google-cloud-sdk
yaourt -S kubernetes-helm (edit version and checksum)
```