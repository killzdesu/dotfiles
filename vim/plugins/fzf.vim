 let f_cmd = 'rg --hidden -g "!**/node_modules/*" -g "!**/.git/*" --files'
if !has("nvim")
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  command! MyFiles call fzf#run(fzf#wrap({
        \  'source': f_cmd
        \}))

  " for other optimization --> try ripgrep (better grep)
  " rg "" -uu -l -g !**/node_modules/* -g !**/.git/*
  " grep -l -R --exclude-dir=node_modules --exclude-dir=.git ""

  nnoremap <silent> <C-p> :MyFiles<CR>
  nnoremap <silent> <Leader>b :Buffers<CR>

  let g:fzf_colors = 
        \{  'border': ['fg', 'Keyword']}
endif

if has("nvim")
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  " Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  command! MyFiles :Telescope find_files

  nnoremap <silent> <C-p> <cmd>MyFiles<cr>
  nnoremap <silent> <leader>b <cmd>lua require"telescope.builtin".buffers()<cr>
endif
