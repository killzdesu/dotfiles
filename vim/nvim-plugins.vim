" Dev Icon
Plug 'kyazdani42/nvim-web-devicons'
" Indent line
Plug 'lukas-reineke/indent-blankline.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'onsails/lspkind-nvim'

Plug 'folke/trouble.nvim'

" Smooth nvim scroll
Plug 'karb94/neoscroll.nvim'

" Unused plugins
" Plug 'glepnir/lspsaga.nvim'

" Install LSP via npm
" TSX+JS: npm install -g typescript typescript-language-server
" Volar: npm install -g @volar/server
" Vim: npm install -g vim-language-server
" Lua: https://github.com/sumneko/lua-language-server

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autopair
" Plug 'windwp/nvim-autopairs'
Plug 'nathom/filetype.nvim'
lua vim.g.did_load_filetypes = 1
