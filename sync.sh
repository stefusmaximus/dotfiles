#!/usr/bin/env bash

dotfiles_dir=$(pwd)
ignore_files=( .git .. . )

function sync_file() {
  local file=$1
  symlink_src="${HOME}/${file}"
  symlink_dst="${dotfiles_dir}/${file}"
  if [ -f "${symlink_src}" ]; then
    return
  fi

  #ln -s "${symlink_dst}" "${symlink_src}"
  echo "Linked: ${symlink_src} -> ${symlink_dst}"
}

# loop over all dotfiles in repo
for file in "${dotfiles_dir}"/.*; do
  filename=$(basename "${file}")
  # todo: check how to do 'contains'
  if [ "${filename}" == "${ignore_files[0]}" ] \
    || [ "${filename}" == "${ignore_files[1]}" ] \
    || [ "${filename}" == "${ignore_files[2]}" ]; then
    continue
  fi

  sync_file "${filename}"
done

