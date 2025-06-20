return {
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opt = {}
  },

  -- Autotag plugin
  -- {
  --   "windwp/nvim-ts-autotag",
  --   event = {"BufReadPre", "BufNewFile"},
  --   opts={ }
  -- },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "^3.0", -- Use for stability; omit to use `main` branch for the latest features
    event = {"BufReadPre", "BufNewFile"},
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- Split-Join plugin
  {
    'Wansmer/treesj',
    event = "VeryLazy",
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
}
