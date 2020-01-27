#!/usr/bin/env bash

git clone --bare https://github.com/micholczyk/system-dots $HOME/.dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
cd $HOME
echo ".dots" >> .gitignore
dots checkout
if [ $? = 0 ]; then
  echo "Checked out dots."
  else
    echo "Backing up pre-existing dot files."
    mkdir -p .dots-backup
    dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dots-backup/{}
fi
dots checkout
dots config --local status.showUntrackedFiles no
