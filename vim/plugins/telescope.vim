lua << EOF
require("telescope").setup {
  pickers = {
    find_files = {
      find_command = { "rg",
        '""',
        "--no-ignore-vcs", 
        "-l",
        "-g",
        "!**/node_modules/*",
        "-g",
        "!**/.git/*"
        }
      },
    }
  }
EOF
