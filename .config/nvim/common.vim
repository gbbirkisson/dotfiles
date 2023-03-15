" Map leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" Center cursor when jumping up and dovn
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Yank to clipboard nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p

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

" Only show cmd bar when entering commands
" set cmdheight=0

" Only show status bar for the buffer in focus
" set laststatus=3

" Quote a selection by doing ciw<c-t>
" vscode: set in settings.json
inoremap <c-t> "<c-r>""

" Close buffers with C-w
nnoremap <C-w> :bd<CR>

" Open files with C-p
" - vscode: this is the default
" - nvim: set in telescope.lua
if has('ide')
   nnoremap <C-p> :action GotoFile<CR>
endif

" Rotate between files with <leader><leader>
" - vscode: set in settings.json
if has('ide')
    nmap <leader><leader> <Action>(PreviousTab)
elseif has('nvim')
    nnoremap <leader><leader> <c-^>
endif

" Use alt + h or l to switch between buffers
" - vscode: set in settings.json
if has('nvim') || has('ide')
    nnoremap <m-l> :bp<CR>
    nnoremap <m-h> :bn<CR>
endif

" Setup check function
nnoremap <leader>ch ovscode
if has('ide')
    nnoremap <leader>ch ointellij
elseif has('nvim')
    nnoremap <leader>ch onvim
else
    nnoremap <leader>ch ounknown
endif
