require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    disable = {},
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = false, -- Experimental feature
    disable = {},
  },
  ensure_installed = {
    "json",
    "typescript",
    "javascript",
    "tsx",
    "vue",
    "html",
    "scss",
    "vim",
    "lua",
  },
  -- ts-context-commentstring integration
  context_commentstring = {
    enable = true,
    -- enable_autocmd = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
