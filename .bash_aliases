################
# BASH ALIASES #
################

# sudo
alias sudo="sudo "
alias s="sudo "

# bash
alias brc="vim $HOME/.bashrc && . $HOME/.bashrc"
alias ba="vim $HOME/.bash_aliases && . $HOME/.bash_aliases"
alias br="source $HOME/.bashrc"

# cat/bat
alias b="bat"

# ssh
alias ssh="kitty +kitten ssh"

# vim
alias vim="vimx"
alias vrc="vim $HOME/.vimrc"
alias v="vim"
alias vp="vim +PluginInstall +qall"

# git
alias grc="vim $HOME/.gitconfig"
alias g="git"

# kitty
alias krc="vim $HOME/.config/kitty/kitty.conf"

# apt
alias install="sudo dnf install"
alias remove="sudo dnf remove"
alias update="sudo dnf upgrade"
alias search="dnf search"
alias list="dnf list"

# python
alias py="python3"
alias python="python3"

# navigation
alias ls="ls -ph --color=auto"
alias la="ls -la"
alias l="ls -l"
alias ll="ls -l"
alias gt="cd $HOME/git/"
alias cd..="cd .."
alias cd-="cd -"

# dotfiles management
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias dupd='dots add -u && dots commit -m "Updates" && dots push'

# find
alias f="find . -name ${1}"
alias fl="locate ${1}"

# misc
alias cl="clear"
