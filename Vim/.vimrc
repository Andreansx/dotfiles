set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8

set number
set relativenumber
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
set laststatus=2
set updatetime=300
set cursorline

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set nobackup
set nowritebackup
set noswapfile

if !isdirectory(expand('~/.vim/undodir'))
    call mkdir(expand('~/.vim/undodir'), 'p')
endif
set undodir=~/.vim/undodir
set undofile

highlight Normal ctermfg=15 ctermbg=NONE
highlight Comment ctermfg=8 cterm=italic
highlight Constant ctermfg=3
highlight String ctermfg=2
highlight Character ctermfg=2
highlight Number ctermfg=3
highlight Boolean ctermfg=3
highlight Float ctermfg=3
highlight Identifier ctermfg=4 cterm=NONE
highlight Function ctermfg=4
highlight Statement ctermfg=7 cterm=NONE
highlight Conditional ctermfg=7
highlight Repeat ctermfg=7
highlight Label ctermfg=7
highlight Operator ctermfg=6
highlight Keyword ctermfg=5
highlight Exception ctermfg=1
highlight PreProc ctermfg=6
highlight Include ctermfg=1
highlight Define ctermfg=6
highlight Macro ctermfg=6
highlight PreCondit ctermfg=6
highlight Type ctermfg=3
highlight StorageClass ctermfg=3
highlight Structure ctermfg=3
highlight Typedef ctermfg=3
highlight Special ctermfg=6
highlight SpecialChar ctermfg=6
highlight Tag ctermfg=5
highlight Delimiter ctermfg=15
highlight SpecialComment ctermfg=8 cterm=bold
highlight Debug ctermfg=1
highlight Underlined cterm=underline
highlight Ignore ctermfg=8
highlight Error ctermfg=1 ctermbg=0
highlight Todo ctermfg=3 ctermbg=NONE cterm=bold,italic

highlight LineNr ctermfg=8 ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight CursorLine cterm=NONE ctermbg=8
highlight CursorLineNr ctermfg=7 ctermbg=8 cterm=bold
highlight Visual ctermfg=0 ctermbg=7
highlight Pmenu ctermfg=15 ctermbg=8
highlight PmenuSel ctermfg=8 ctermbg=7
highlight PmenuSbar ctermbg=8
highlight PmenuThumb ctermbg=7
highlight StatusLine ctermfg=8 ctermbg=7 cterm=bold
highlight StatusLineNC ctermfg=8 ctermbg=0
highlight TabLine ctermfg=8 ctermbg=0
highlight TabLineFill ctermbg=0
highlight TabLineSel ctermfg=0 ctermbg=7
highlight WildMenu ctermfg=0 ctermbg=7

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
