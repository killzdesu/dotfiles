"===== General Settings =====
"
filetype plugin indent on
set nocompatible
syntax on

" set exrc " If there's vimrc inside dir, source that
set noerrorbells
set expandtab
set shiftwidth=2
set tabstop=2
set colorcolumn=84
set smarttab
set autoindent
set smartindent

" " Search
set incsearch
set hlsearch
set lazyredraw
set showmatch
set mat=2

if exists('gonvim_running')
  " Has problem with 'r' in goneovim
  set nolazyredraw
endif

set hidden
set signcolumn=yes
set number relativenumber
set encoding=utf-8
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:»\ ,trail:·
set scrolloff=6
set sidescrolloff=6
set backspace=2 " make backspace delete indent,eol,start

" other
set updatetime=1000
set redrawtime=5000
set noswapfile
set nobackup
set nowritebackup
set shortmess+=c

" Set cursor type
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
