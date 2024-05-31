#! /bin/bash

create_symlinks() {
  script_dir=$(dirname "$(readlink -f "$0")")

  echo "SCRIPT DIR: $script_dir"

  files=$(find -maxdepth 1 -type f -name ".*")

  for file in $files; do
    name=$(basename $file)
    echo "Creating symlink to $name in home directory."
    rm -rf ~/$name
    ln -s $script_dir/$name ~/$name
  done

  if [ ! -d ~/.config/nvim ]
  then
    mkdir -p ~/.config/
    ln -s $script_dir/nvim/.config/nvim ~/.config
  fi
}

create_symlinks
