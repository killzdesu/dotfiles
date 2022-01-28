require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false, -- Experimental feature
    disable = {},
  },
  ensure_installed = {
    "json",
    "tsx",
    "vue",
    "html",
    "scss",
    "vim",
    "lua",
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
