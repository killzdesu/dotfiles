local status,saga = pcall(require, 'lspsaga')
if status then return end
-- Not using LSPSAGA

-- saga.init_lsp_saga {
--   error_sign = '',
--   warn_sign = '',
--   hint_sign = '',
--   infor_sign = '',
--   border_style = "round",
-- }

local opt = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', opt)
vim.api.nvim_set_keymap('n', 'gp', ':Lspsaga preview_definition<CR>', opt)
vim.api.nvim_set_keymap('n', '[e', ':Lspsaga diagnostic_jump_prev<CR>', opt)
vim.api.nvim_set_keymap('n', ']e', ':Lspsaga diagnostic_jump_next<CR>', opt)
vim.api.nvim_set_keymap('n', '<space>rn', ':Lspsaga rename<CR>', opt)
