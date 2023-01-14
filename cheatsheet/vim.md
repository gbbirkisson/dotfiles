# Vim cheatsheet

- [Vim cheatsheet](#vim-cheatsheet)
  - [Vanilla](#vanilla)
    - [Clipboard](#clipboard)
    - [Good stuff](#good-stuff)
  - [Config](#config)
  - [Packer](#packer)
  - [Motions](#motions)
  - [Netrw](#netrw)
  - [Search/Replace](#searchreplace)
  - [Telescope](#telescope)
  - [Harpoon](#harpoon)


## Vanilla

### Clipboard

- `"+p` Paste from clipboard
- `"+yy` Yank to clipboard

### Good stuff

- `0D` Delete contents of line

## Config

- `:so` Source current config file

## Packer

- `:PackerSync` Sync packer

## Motions

- `ap` A paragraph
  - Comment a paragraph: `gcap`
- `=` Align selected lines nicely

## Netrw

- `:Ex`, `<space>pv` Open dir of current file
- `%` Create new file

## Search/Replace

- Visual Line
  - Select lines with `shift` + `v`
  - Start replace with `:s/<old>/<new>` and `enter`

## Telescope

- `<leader>pf` Find file
- `<C-p>` Find git file
- `<leader>ps` Grep in files

## Harpoon

- `<leader>a` Add file
- `<C-e>` Quick menu
- `<C-h>` Nav File 1
- `<C-j>` Nav File 2
- `<C-k>` Nav File 3
- `<C-l>` Nav File 4
