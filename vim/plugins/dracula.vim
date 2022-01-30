if !has('nvim')
  Plug 'dracula/vim', { 'as': 'dracula' }
  let g:lightline = {'colorscheme' : 'dracula'}
else
  Plug 'Mofiqul/dracula.nvim'
endif

" augroup DraculaOverrides
"   autocmd!
"   autocmd User PlugLoaded ++nested colorscheme dracula
" augroup end
