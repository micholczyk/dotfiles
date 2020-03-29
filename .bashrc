######################
# BASH CONFIGURATION #
######################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source bash aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 8)\]\\$ \[$(tput sgr0)\]"
#export PS1=" \[\e[00;34m\]Ω \W \[\e[0m\]"
