" set leader key
" let g:mapleader = "\<Space>"
let g:mapleader = ","

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=2
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
"set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set relativenumber                      " Show relative line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set wrap                                " text wrap
setlocal spell spelllang=en_us          " set spell check
set hlsearch                            " show highlighting in search
set splitbelow splitright               " open split below and right
set tabpagemax=30                       " can open max of 30 tabs
set pyxversion=3
set termguicolors
"set autochdir                           " Your working directory will always be the same as your working directory

set showbreak=↪\ 
set list				" Sets white spaces
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=tab:→·,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:•

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

map <leader>d :nohlsearch<CR>

fu! ConvertToTabs()
  set noexpandtab
  retab!
endfunc
com! -nargs=0 ConvertToTabs :call ConvertToTabs()

fu! ConvertToSpaces()
  set expandtab
  retab!
endfunc
com! -nargs=0 ConvertToSpaces :call ConvertToSpaces()
