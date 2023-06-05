" Center cursor when jumping up and dovn
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Center cursor when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Yank/Paste from clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Move lines up and down with <A-j> and <A-k>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Rotate between files with <leader><leader>
nnoremap <leader><leader> <c-^>
