Plug 'dracula/vim', { 'as': 'dracula' }
if has('nvim')
  Plug 'Mofiqul/dracula.nvim'
endif

let g:lightline = {'colorscheme' : 'dracula'}

augroup DraculaOverrides
  autocmd!
  autocmd User PlugLoaded ++nested colorscheme dracula
augroup end
