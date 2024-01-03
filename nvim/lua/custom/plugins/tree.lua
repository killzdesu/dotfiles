return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { "<C-n>", ":NvimTreeToggle<CR>", noremap = true, silent = true },
  },
  config = function()
    -- On attach function which replaces view.mappings
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- Attach default keymaps
      api.config.mappings.default_on_attach(bufnr)
      -- Custom keymaps go here
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    end
    local opts = {
      -- New on_attach that replaces view.mappings
      on_attach = on_attach,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = false,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        -- height = 30,
        side = "left",
      },
    }
    require("nvim-tree").setup(opts)
  end,
}

