# killz's personal dotfiles
For remote vim/neovim config

# How to use
## Using install script
For bash shell script run `install.sh` for install dotfiles

_may need to config permission before running install script_

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

# Environment Setup
For Windows suggest using [scoop](https://scoop.sh) for command line installer
## Git
```
sudo apt-get install git-all

scoop install git
```
## Neovim
Official Guide [Here](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```
sudo apt-get install neovim

scoop install neovim
```
However Neovim needs build tools such as **gcc**, **clang**. For Windows, easiest way is to install MinGW build tools from scoop
```
scoop install mingw-winlibs
```
## Node
There are 2 ways 
1. Install nodejs itself 
```
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

scoop install nodejs
```
or 2. Install via nvm (Windows version [here](https://github.com/coreybutler/nvm-windows))
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
```
