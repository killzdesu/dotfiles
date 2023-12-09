return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  opts = {
    -- show_trailing_blankline_indent = false,
    -- show_first_indent_level = false,
    -- show_current_context = true,
    whitespace = {
      -- remove_blankline_trail = true,
    },
    exclude = {
      buftypes = {"terminal", "nofile"},
      filetypes = {
        "NvimTree",
        "Trouble"
      },
    },
    -- Rainbow color for context
    scope = {
      highlight = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
      }
    
    },
  },
  config = function(_, opts)
    -- Highlight rainbow indentline
    -- Set Rainbow color for Context Char Highlight
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

    require("ibl").setup(opts)

  end,
}
