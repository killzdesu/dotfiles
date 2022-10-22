#! /bin/bash

echo "Applying dotfiles"
mkdir -p ~/.config
echo "Copying neovim config..."
cp -r ./nvim ~/.config/
echo "Copying vim config..."
cp -r ./vim ~/
mv ~/vim ~/.vim
echo "Complete copying dotfiles"
echo "For neovim, run :PackerSync"
echo "For vim, run :PlugInstall"
