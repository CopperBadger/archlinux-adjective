#!/bin/bash

echo "Installing systemd unit files"

for uf in ../systemd/user/*; do
  fname=$(basename ${uf})
  replace=y
  if [[ -e "/usr/lib/systemd/user/${fname}" ]]; then
    replace=n
    echo -n "${fname} already exists. Replace it? [yN]: "
    read -r replace
  fi
  if [[ "${replace}" == "y" ]]; then
    echo "Linking ${fname}..."
    sudo ln -fs "${uf}" /usr/lib/systemd/user/
    echo -n "Would you like to enable ${fname}? [yN]: "
    read -r en
    if [[ "${en}" == "y" ]]; then
      sudo systemctl --user enable ${fname}
      sudo systemctl --user start ${fname}
    fi
  fi
done
