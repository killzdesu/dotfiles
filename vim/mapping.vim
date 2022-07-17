"===== Keymaps =====
"
let mapleader = "\\"

nmap <leader>ve :e $MYVIMRC<CR>
nmap <leader>vr :source $MYVIMRC<CR>
map <C-c> <Esc>
nmap <silent> <leader><Space> :noh<CR>


map <silent>gf :edit <cfile><CR>

" Reselect visual after indenting
vnoremap < <gv
vnoremap > >gv

" Insert mode shortcut
" imap ;; <Esc>A;<Esc>

nnoremap B ^
nnoremap E $

