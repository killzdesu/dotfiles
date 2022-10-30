@echo off
echo Installing dotfiles
echo Copying neovim config...
xcopy .\nvim %localappdata%\nvim /E /I
echo Copying vim config...
xcopy .\vim %userprofile%\vimfiles /E /I
echo Complete copying dotfiles
echo For neovim, run :PackerSync
echo For vim, run :PlugInstall
