local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    preview = false,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    find_files = {
      find_command = {
        'rg',
        '--files',
      },
    },
    buffers = {
      sort_mru = true,
      sort_lastused = true,
    },
  }
})
-- require('telescope').load_extension('fzf')
