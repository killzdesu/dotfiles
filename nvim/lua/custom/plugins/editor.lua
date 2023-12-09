return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = {"BufReadPre", "BufNewFile"},
    config = function()
      require("nvim-surround").setup()
    end
  },
  -- Autotag plugin
  { "windwp/nvim-ts-autotag", event = { "InsertEnter" }, opts={ } },
  -- Split-Join plugin
  {
    'Wansmer/treesj',
    keys = { '<space>j', '<space>m', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
}
