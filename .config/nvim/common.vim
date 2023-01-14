" Map leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Center cursor when jumping up and dovn
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Yank to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
inoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
nnoremap <right> <nop>
inoremap <right> <nop>

" Scrolloff
set so=8

" Line numbers
set nu
set relativenumber

" Close nvim buffers with C-w
if has('nvim')
    nnoremap <C-w> :bd<CR>
endif

" TODO swith buffers with alt-h and alt-l
" TODO <leader><leader> swith to other file

" Setup check function
nnoremap <leader>ch ovscode
if has('ide')
    nnoremap <leader>ch ointellij
elseif has('nvim')
    nnoremap <leader>ch onvim
else
    nnoremap <leader>ch ounknown
endif
