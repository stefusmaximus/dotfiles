#!/usr/bin/env bash

dotfiles_dir=$(pwd)
ignore_files=( .git .. . )

# loop over all dotfiles in repo
for file in "${dotfiles_dir}"/.*; do
  filename=$(basename "${file}")
  # todo: check how to do 'contains'
  if [ "${filename}" == "${ignore_files[0]}" ] \
    || [ "${filename}" == "${ignore_files[1]}" ] \
    || [ "${filename}" == "${ignore_files[2]}" ]; then
    continue
  fi

  symlink_src="${HOME}/${filename}"
  symlink_dst="${dotfiles_dir}/${filename}"
  if [ -f "${symlink_src}" ]; then
    continue
  fi

  ln -s "${symlink_dst}" "${symlink_src}" 
  echo "Linked: ${symlink_src} -> ${symlink_dst}"
done
