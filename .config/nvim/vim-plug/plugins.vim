" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    Plug 'tomasr/molokai'
    " COC stable
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " ready made snyppets
    Plug 'honza/vim-snippets'
    " status bar
    Plug 'itchyny/lightline.vim'
    " comment out code
    Plug 'scrooloose/nerdcommenter'
    " git gutter (honks)
    Plug 'mhinz/vim-signify'
    " better git
    Plug 'tpope/vim-fugitive'
    "show colors change in insert mode
    Plug 'norcalli/nvim-colorizer.lua'
    "rainbow brackets
    Plug 'junegunn/rainbow_parentheses.vim'
    "welcome screen
    Plug 'mhinz/vim-startify'
    "switching between alternative files
    Plug 'tpope/vim-projectionist'
    " floating terminal
    Plug 'voldikss/vim-floaterm'
    " can surround txt
    Plug 'tpope/vim-surround'
    "telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " file tree viewer
    Plug 'nvim-neo-tree/neo-tree.nvim'

call plug#end()

