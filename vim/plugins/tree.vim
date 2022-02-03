if !has('nvim')
else
  Plug 'kyazdani42/nvim-tree.lua'
  nnoremap <C-n> :NvimTreeToggle<CR>
  highlight NvimTreeFolderIcon guibg=blue
endif
