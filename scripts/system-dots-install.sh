#!/usr/bin/env bash

alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
echo ".dots" >> .gitignore
git clone --bare https://github.com/micholczyk/system-dots $HOME/.dots
mkdir -p .dots-backup
dots checkout
if [ $? = 0 ]; then
  echo "Checked out dots."
  else
    echo "Backing up pre-existing dot files."
    dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dots-backup/{}
fi
dots checkout
dots dots status.showUntrackedFiles no
