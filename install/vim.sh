#!/bin/bash

if [[ -e "$HOME/.vim/bundle/Vundle.vim" ]]; then
  echo "Vundle appears to already be installed. Remove $HOME/.vim/bundle/Vundle.vim to force reinstallation."
  exit 1
fi

if [[ ! -e "$HOME/.vimrc" ]]; then
  echo "$HOME/.vimrc does not exist, please create it first before installing."
  exit 1
fi


here="$(pwd)"

echo "Installing Vundle..."
mkdir -p "$HOME/.vim/bundle"
cd "$HOME/.vim/bundle"
git clone https://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall

cd "${here}"

# Neovim installation
if [[ -e "$HOME/.config/nvim" ]]; then
  echo "Neovim already appears to have a configuration directory. Remove $HOME/.config/nvim to force reinstallation."
  exit 1
fi

echo "Configuring Neovim..."
ln -s "$HOME/.vim" "$HOME/.config/nvim"
ln -s "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"
