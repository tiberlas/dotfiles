" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -3<CR>
nnoremap <M-k>    :resize +3<CR>
nnoremap <M-h>    :vertical resize -3<CR>
nnoremap <M-l>    :vertical resize +3<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save Ctlr+s
nnoremap <C-s> :wa<CR>
" Alternate way to quit Ctrl+q
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape Ctrl+c
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" swap split position
" Leader => \
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-W>t<C-w>K

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" center the cursor when jumping 
nnoremap n nzzzv " goto next, center screen, unfold txt
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap G Gzz

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u
inoremap { {<c-g>u
inoremap ' '<c-g>u
inoremap " "<c-g>u

" add relative jumps to jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" move lines above or below
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" bigger jump
nnoremap zj 25jzz
nnoremap zk 25kzz

" close all buffers except the last edited
"%bd - close all the buffers
"e# - open last edited file
"bd# - close the unnamed buffer
nnoremap <Leader>w :%bd<CR>:e#<CR>:bd#<CR>
