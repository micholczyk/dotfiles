################
# BASH ALIASES #
################

# sudo
alias sudo="sudo "
alias s="sudo "

# bash
alias brc="vim $HOME/.bashrc"
alias ba="vim $HOME/.bash_aliases"
alias br="source $HOME/.bashrc"

# vim
alias vrc="vim $HOME/.vimrc"
alias v="vim"

# git
alias grc="vim $HOME/.gitconfig"
alias g="git"

# apt
alias install="sudo apt install"
alias remove="sudo apt remove"
alias reinstall="sudo apt reinstall"
alias update="sudo apt update && sudo apt upgrade"
alias purge="sudo apt purge ${1} && sudo apt autoremove"
alias search="apt search"
alias list="apt list"

# python
alias py="python3"
alias python="python3"
alias py2="python2"
alias python2="python2"

# navigation
alias la="ls -la"
alias ll="ls -l"
alias gt="cd $HOME/git/"

# dotfiles management
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# find
alias f="find . -name ${1}"

# misc
alias cl="clear"
