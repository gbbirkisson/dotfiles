" Enable plugs: https://github.com/junegunn/vim-plug
" To install plugins run :PlugInstall
call plug#begin()

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

" GUI
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language support
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-pyright

" Markdown toc
Plug 'mzlogin/vim-markdown-toc'

call plug#end()

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
nnoremap <right> <nop>
inoremap <right> <nop>

" Left and right can switch buffers
"nnoremap <left> :bp<CR>
"nnoremap <right> :bn<CR>

" Toggle hybrid line numbers
:set relativenumber
:set nu rnu
highlight LineNr ctermbg=235

" Always show git gutter
set signcolumn=yes

" Set fzf window
let g:fzf_layout = { 'down': '~23%' }

" Open hotkeys
map <C-p> :Files<CR>
map <C-j> :Buffers<CR>

" Leader magic
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader><leader> <c-^>

" Permanent undo
set undodir=~/.vimdid
set undofile

" Yank to clipboard using +y
set clipboard+=unnamedplus
