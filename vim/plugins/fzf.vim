Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

command! MyFiles call fzf#run(fzf#wrap({
      \  'source': 'rg "" -uu -l -g !**/node_modules/* -g !**/.git/*'
      \}))

" for other optimization --> try ripgrep (better grep)
" rg "" -uu -l -g !**/node_modules/* -g !**/.git/*
" grep -l -R --exclude-dir=node_modules --exclude-dir=.git ""

nnoremap <silent> <C-p> :MyFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

let g:fzf_colors = 
      \{  'border': ['fg', 'Keyword']}
