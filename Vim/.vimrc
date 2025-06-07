set nocompatible
filetype plugin indent on
syntax on

set encoding=utf-8

set number
set relativenumber
set cursorline
set scrolloff=8
set showcmd
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrap
set linebreak
set showbreak=↪
set wildmenu
set wildmode=longest:full,full
set mouse=a
set clipboard=unnamedplus

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set laststatus=2
set updatetime=300

set nobackup
set nowritebackup
set noswapfile

if !isdirectory(expand('~/.vim/undodir'))
    call mkdir(expand('~/.vim/undodir'), 'p')
endif
set undodir=~/.vim/undodir
set undofile

let mapleader = "\<Space>"

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>so :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>es :split $MYVIMRC<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap jk <Esc>
inoremap kj <Esc>

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
