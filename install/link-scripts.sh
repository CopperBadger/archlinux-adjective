#!/bin/bash

echo "Now linking in utility scripts"

if [[ -e "$HOME/sbin" ]]; then
  echo -n "/usr/local/sbin is already linked in your home directory. Is it okay to re-link sbin? [yN]: "
  read -r cont
  if [[ "${cont}" != "y" ]]; then
    echo "Script linking aborted"
    exit 1
  fi
fi


user=$(whoami)
group=$(id -g -n "${user}")
home="$(realpath ~)"
sudo ln -fs /usr/local/sbin "${home}/sbin"
sudo chown ${user}:${group} "${home}/sbin"

for f in ../util/*; do
  fname=$(basename ${f})
  replace=y
  if [[ -e "/usr/local/sbin/${fname}" ]]; then
    replace=n
    echo -n "${fname} already exists in /usr/local/sbin. Replace it? [yN]: "
    read -r replace
  fi
  if [[ "${replace}" == "y" ]]; then
    echo "Linking in ${fname} ..."
    sudo ln -fs "$(realpath ${f})" "/usr/local/sbin/${fname}"
  fi
done
