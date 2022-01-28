if !has('nvim')
  Plug 'itchyny/lightline.vim'

  set laststatus=2
  let g:lightline = {'colorscheme' : 'wombat'}

else
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
endif
