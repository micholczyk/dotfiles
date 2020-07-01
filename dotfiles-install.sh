#!/usr/bin/env bash

# Allow the script to use aliases.
shopt -s expand_aliases

git clone --bare https://github.com/micholczyk/dotfiles $HOME/.dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

cd $HOME
echo ".dots" > .gitignore
dots checkout &> /dev/null
if [ $? = 0 ]; then
  echo "Checked out dotfiles."
  else
    echo "Backing up pre-existing dotfiles."
    mkdir -p .dots_backup
    dots checkout 2>&1 | cut -d" " -f 1 | tail -n +2 | head -n -2 | \
	awk {'print $1'} | \
	parallel 'mkdir -p $HOME/.dots_backup/{}; mv {} $HOME/.dots_backup/{}'
	dots checkout &> /dev/null
fi

dots config --local status.showUntrackedFiles no
