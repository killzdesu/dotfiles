# killz's personal dotfiles
For remote vim/neovim config

# How to use
## Vim
1. Clone this repo and move `vim` to `~/.vim`
2. if you're using Windows, make sure to symlink to **vimfiles**
`mklink /D .vim vimfiles`
3. run following code in vim
`:PlugInstall`
4. (Optional) Install ripgrep (rg) for better fzf
if you've not done this, make sure to config find_command in `fzf.vim`

## Neovim
1. Clone this repo and move `nvim` to `~/.config/nvim`
2. if you're using Windows, make sure to symlink to **~/AppData/Local/nvim**
`mklink /D ~/.config/nvim nvim`
3. run `:PackerSync` in nvim
