""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           
"  _    _   _ _               _             author: t.tiberius
" | |  | | (_) |             (_)            usage:
" | |_ | |_ _| |__   ___ _ __ _ _   _ ___     vim config file
" | __|| __| | '_ \ / _ \ '__| | | | / __|    
" | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
"  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
"                                             
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GENERAL
let g:mapleader = " "              " set leader key
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=2
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set noexpandtab                         " Use TABS as line indent
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set relativenumber                      " Show relative line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set showmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set wrap                                " text wrap
setlocal nospell spelllang=en_us        " disables spell check
set hlsearch                            " show highlighting in search
set splitbelow splitright               " open split below and right
set tabpagemax=30                       " can open max of 30 tabs
set pyxversion=3
set termguicolors
set scrolloff=8
set sidescrolloff=8
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:~,extends:⟩,precedes:⟨,space:•
set list                                " Sets white spaces

colorscheme monokai
" transparent background
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" MAPPINGS
inoremap kj <Esc>                       " go to NORMAL mode
inoremap jk <Esc>
inoremap KJ <Esc>
vnoremap JK <Esc>

inoremap zk :m-2<CR>                 " move current line up
inoremap zj :m+1<CR>                 " move current line down

nnoremap <M-j> :resize -4<CR>
nnoremap <M-k> :resize +4<CR>
nnoremap <M-h> :vertical resize +4<CR>
nnoremap <M-l> :vertical resize -4<CR>

map <leader>d :nohlsearch<CR>           " disable hl search
nnoremap gU viwU<Esc>                   " converts word to upper case
nnoremap gu viwu<Esc>                   " converts word to lower case
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" center this commands
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J MzJ`z
nnoremap G Gzz
nnoremap * *Nzz

" navigate through windows with Ctrl-h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q

" center text
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap zj :m .+1<CR>==
nnoremap zk :m .-2<CR>==
nnoremap * *Nzz

" registar T
nnoremap <leader>e \"t
vnoremap <leader>e \"t

" open file explorer in new vertical split
nnoremap <leader>f <C-w>v:Explore<CR>

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vim alternatively you can run :source $MYVIMRC

