local status,trouble = pcall(require, 'trouble')
if not status then return end

trouble.setup{}

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)
