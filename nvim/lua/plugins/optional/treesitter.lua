return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  branch = 'master',
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- [[ Configure Treesitter ]]
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { 'cpp', 'lua', 'python', 'html', 'javascript', 'json', 'typescript', 'vimdoc', 'vim', 'yaml' },

      -- Use curl & tar for install TSS (git is going to be deprecated)
      -- prefer_git = false,
      
      auto_install = false, -- Don't autoinstall ALL langs
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
        disable = { 'python' }
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },

      -- ## for some reason textobjects always error :(
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      --     keymaps = {
      --       -- You can use the capture groups defined in textobjects.scm
      --       ["aa"] = "@parameter.outer",
      --       ["ia"] = "@parameter.inner",
      --       ['af'] = '@function.outer',
      --       ['if'] = '@function.inner',
      --       ['ac'] = '@class.outer',
      --       ['ic'] = '@class.inner',
      --     },
      --   },
      -- },
    }

  end,
}
