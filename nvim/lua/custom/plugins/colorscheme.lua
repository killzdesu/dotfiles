return  {
  {
    'folke/tokyonight.nvim',
    version = '*',
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  },
  {
    'navarasu/onedark.nvim',
    opts = { style = 'Warmer' },
    lazy = true,
  },
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'sonokai'
    end,
  },
}

