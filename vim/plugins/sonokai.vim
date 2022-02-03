Plug 'sainnhe/sonokai'

" let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

augroup SonokaiOverrides
  autocmd!
  autocmd User PlugLoaded ++nested colorscheme sonokai
augroup end
