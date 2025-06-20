return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'williamboman/mason.nvim',
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      },
    },
    "neovim/nvim-lspconfig",

    -- Status updates/progression for LSP
    { 'j-hui/fidget.nvim', opts = {} },

  },
  config = function()
    local mason_lspconfig = require 'mason-lspconfig'
    local server_list = { "lua_ls", "vue_ls", "intelephense", "jsonls" }
    mason_lspconfig.setup({
      ensure_installed = server_list
    })
  end,
}
