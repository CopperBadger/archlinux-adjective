#!/bin/bash

echo "Configuring zsh..."

if [[ -e "$HOME/.zsh/" ]]; then
  echo "$HOME/.zsh/ already exists. Remove it to force reinstallation of configuration."
else
  here=$(pwd)

  mkdir -p "$HOME/.zsh"
  cd "$HOME/.zsh"
  echo "Installing git-flow-completion"
  git clone https://github.com/bobthecow/git-flow-completion.git

  cd "${here}"
fi

echo "Setting user login shell to zsh"
current=$(basename $(echo $0))
if [[ "${current}" != "zsh" ]]; then
  chsh -s $(which zsh) $(whoami)
fi
